setGeneric("toSOAP",
            function(obj, con = xmlOutputBuffer(header = ""), type = NULL,
                      literal = FALSE, elementFormQualified = FALSE, ...) {
              tmp <- standardGeneric("toSOAP")

                # For the methods that just format the value (e.g. SOAPDataType, decimal, etc.)
                # we'll add the text as a child of con if it is an XML node
              if(is.vector(tmp) && is(con, "XMLInternalElementNode") && xmlSize(con) == 0)
                 xmlValue(con) = tmp

#??? Is this the right thing to be doing?
   if(FALSE) {
              if(is(tmp, "XMLInternalNode") && !is.null(xmlParent(tmp)) && (is(con, "XMLInternalDocument") || is(con, "XMLInternalNode")))
                 addChildren(con, tmp)
   }
              
              tmp
            })



#XXX Added for preserving Elements in processSchemaType, etc.
setMethod("toSOAP", c("ANY", "XMLInternalElementNode", type = "Element"),
              function(obj, con = xmlOutputBuffer(header=""), type = NULL, literal = FALSE, elementFormQualified = FALSE, ...)
                  toSOAP(obj, con, type@type, literal, elementFormQualified, ...))


setMethod("toSOAP", c("POSIXt", type = "SchemaDateType"),
              function(obj, con = xmlOutputBuffer(header=""), type = NULL, literal = FALSE, elementFormQualified = FALSE, ...)
                  format(obj, "%Y-%m-%d"))

setMethod("toSOAP", c("date", type = "SchemaDateType"),
              function(obj, con = xmlOutputBuffer(header=""), type = NULL, literal = FALSE, elementFormQualified = FALSE, ...) {
                  ans = format(as(obj, "Date"), "%Y-%m-%d") #????XXX as.Date(obj) doesn't work. Gets a value off by 10 years!
                  ans
                 }) 

# ??? Time zone information.
setMethod("toSOAP", c("POSIXt", type = "SchemaDateTimeType"),
              function(obj, con = xmlOutputBuffer(header=""), type = NULL, literal = FALSE, elementFormQualified = FALSE, ...)
                  format(obj, "%Y-%m-%dT%H:%M:%S"))


setMethod("toSOAP", c("POSIXt", type = "SchemaTimeType"),
              function(obj, con = xmlOutputBuffer(header=""), type = NULL, literal = FALSE, elementFormQualified = FALSE, ...)
                  format(obj, "%h:%M:%S"))


setMethod("toSOAP", c("vector", type = "NULL"),
              function(obj, con = xmlOutputBuffer(header=""), type = NULL, literal = FALSE, elementFormQualified = FALSE, ...)
                   toSOAPArray(obj, con, type = type, literal = literal, ...))

setMethod("toSOAP", c("list", type = "NULL"),
          #
          # Is this ever used? If so, the first cat doesn't seem to make sense, i.e. leaves a <nodeName open.
          #
          #
function(obj, con = xmlOutputBuffer(header=""), type = NULL, literal = FALSE, elementFormQualified = FALSE, ...)
{
 if(length(names(obj)))
   return(toSOAPNamedContainer(obj, con, type, ...))
 
 if(length(obj) > 1) {
    # If we have named elements, then we need to do something with these rather than lose them
    # so we put them out as named elements, i.e. as a struct.
  if(!is.null(names(obj))) {
    for(i in names(obj)) {
#XXXXXX      
      cat("<", i, file = con, sep="")
      writeTypes(obj[[i]])
      cat(obj[[i]])
    }
  } else {
    toSOAPArray(obj, con, type = type, literal = literal, ...)
  }
 } else {
    cat(obj, file=con)
 }

 invisible(TRUE)
})



setMethod("toSOAP", c("ANY", type = "SchemaType"),
function(obj, con = xmlOutputBuffer(header=""), type = NULL, literal = FALSE, elementFormQualified = FALSE, ...)
{
  if(literal) {
     for(i in names(getSlots(class(obj)))) {
       if(inherits(con, "connection")) {
          cat("<", i, ">", sep = "", file = con)
          p = con
       }
       else {
          p = newXMLNode(i)
          if(!is.null(con)) {
             addChildren(con, p)
          }
       }
       toSOAP(slot(obj, i), con = p, literal = literal)
       if(inherits(con, "connection"))       
          cat("</", i, ">\n", sep = "", file = con)       
     }
   } else {
      stop("No code yet for the toSOAP method for any object and SchemaType pair with literal = FALSE")
   }

   invisible(TRUE)
})



setMethod("toSOAP", c("ANY", type = "ClassDefinition"),
function(obj, con = xmlOutputBuffer(header=""), type = NULL, literal = FALSE, elementFormQualified = FALSE, ...)
{
  # literal = TRUE #XXX - xxxx

  types = type@slotTypes
  if(literal) {
     for(i in names(getSlots(class(obj)))) {
       val = slot(obj, i)
       tp = types[[i]]
       if(length(val) == 0 && length(tp@count) > 0 && min(tp@count) == 0)
         next
       
       if(inherits(con, "connection")) {
          cat("<", i, ">", sep = "", file = con)
          p = con
       }
       else {
          if(!is(tp, "Element"))
              p = newXMLNode(i, parent = con)
          else
              p = con
#         if(!is.null(con)) {
#            addChildren(con, p)
#         }
       }
       toSOAP(val, con = p, type = tp, literal = literal)
       if(inherits(con, "connection"))       
          cat("</", i, ">\n", sep = "", file = con)       
     }
   } else {
      stop("No code yet for the toSOAP method for any object and ClassDefinition pair with literal = FALSE")
   }

   invisible(TRUE)
})


setGeneric("toSOAPArray",
            function(obj, con = stdout(), type = NULL, literal = FALSE, elementFormQualified = FALSE, ...)
               {
                 if(length(names(obj))) 
                   return(toSOAPNamedContainer(obj, con))

                 standardGeneric("toSOAPArray")
               })

 # XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 #XXXXXXXXXXXXXXXXXXX
 # Looks like this is overridden below.
setMethod("toSOAP", c("vector", "XMLInternalElementNode", type = "missing"),
#
#  Taken from toSOAPArray method for "vector" (only) below.
#
function(obj, con = stdout(), type = NULL, literal = FALSE, elementFormQualified = FALSE, ...)
{  
   if(length(obj) == 1 && (is.null(type) || is(type, "PrimitiveSchemaType"))) {
      tmp = newXMLTextNode(obj, parent = con)
      return(tmp)
   }

    lapply(obj, function(i) newXMLNode("item", i, parent = con))
 })

setMethod("toSOAPArray", c("vector"),
function(obj, con = stdout(), type = NULL, literal = FALSE, elementFormQualified = FALSE, ...)
{
   if(length(obj) == 1 && (is.null(type) || is(type, "PrimitiveSchemaType"))) {
      tmp = newXMLTextNode(obj)
     # if(is(con, "XMLInternalDocument") || is(con, "XMLInternalNode"))
     #    addChildren(xmlRoot(con), tmp)
      return(tmp)
   }

   if(!is.null(type))
     elType = type@elType
   else
     elType = NULL

 #  for(i in obj) {
 #    newXMLNode("item", parent = con)
 #   }
 lapply(obj, function(i) newXMLNode("item", i))
   
})

setMethod("toSOAPArray", c("vector", "connection"),
function(obj, con = stdout(), type = NULL, literal = FALSE, elementFormQualified = FALSE, ...)
{
   if(length(obj) == 1 && is.null(type)) {
      cat(obj, file = con)
      return(TRUE)     
   }

   newLine = "\r\n"
   newLine=""   

   if(!is.null(type))
     elType = type@elType
   else
     elType = NULL


    for(i in obj) {
if(TRUE) {
  tag = "item"
#  tag = gsub("^xsd:", "SOAP-ENC:", getSOAPType(i))
      cat("<", tag, " ", sep = "", file=con)
      writeTypes(i, con) # , type = elType)
      cat(">", newLine, sep="", file=con)
      cat(i, file=con)
      cat(newLine, "</", tag, ">", sep="", file=con)
} else {
  tmp = strsplit(getSOAPType(typeof(i)), ":")[[1]][2]
  cat("<", tmp, ">", sep="", file = con)
  cat(i, file=con)
  cat("</", tmp, ">", sep="", file=con)
}
    }
#   cat("</SOAP-ENC:Array>", file = con)
})


# toSOAPArray for XMLNode and Document object
tmp =
function(obj, con = stdout(), type = NULL, literal = FALSE, elementFormQualified = FALSE, ...)
{

   if(length(names(obj))) {
     return(toSOAPNamedContainer(obj, con))
   }
  
   if(length(obj) == 1 && (is.null(type) || is(type, "PrimitiveSchemaType") ))
     return(newXMLTextNode(obj, parent = con))

   if(!is.null(type))
      elType = type@elType
   else
      elType = NULL

     # Not activated yet. We just pass the XMLInternalDocument
    parent = if(is(con, "XMLInternalNode") || is(con, "XMLInternalDocument")) con else NULL
    # parent = NULL

    lapply(obj,
           function(x) {
               # Since we typically don't have a parent node, we have to suppress the
               # warning about the xsi name space definition. And the problem is that
               # we don't even know which xsi namespace to use - 1999 or 2001
            newXMLNode("item",  x, attrs = writeTypes(x, con), parent = parent,
                        suppressNamespaceWarning = TRUE)
           })
}  

setMethod("toSOAPArray", c("vector", "XMLInternalDocument"), tmp)
setMethod("toSOAPArray", c("vector", "XMLInternalNode"), tmp)




setMethod("toSOAP", c("vector", "connection", type = "PrimitiveSchemaType"),
              function(obj, con = xmlOutputBuffer(header=""), type = NULL, literal = FALSE, elementFormQualified = FALSE, ...) {
                val = type@toConverter(obj)
                if(length(val) > 1)
                  warning("Converting value to primitive SOAP type results in vector with more than one element. Ignoring remainder.")
                cat(val[1], file = con)
              }
)


tmp =
function(obj, con = xmlOutputBuffer(header=""), type = NULL, literal = FALSE, elementFormQualified = FALSE, ...)
{

           val = type@toConverter(obj)
           if(length(val) > 1)
             warning("Converting value to primitive SOAP type results in vector with more than one element. Ignoring remainder.")
           newXMLTextNode(val[1], doc = con)
       }
                         #??? should this be XMLInternalElementNode ???
setMethod("toSOAP", c("vector", "XMLInternalDocument", type = "PrimitiveSchemaType"), tmp)
setMethod("toSOAP", c("vector", "XMLInternalDocument", type = "SchemaStringType"), tmp)

if(FALSE) {
  #XXX Added these since major changes to XMLSchema. Why do we need this when we used  not.
   #XXX We don't. Problem was generic for toSOAP was being truncated because of the ans = standardGeneric()
   # not ans <- standardGeneric()
tmp =  function(obj, con = xmlOutputBuffer(header=""), type = NULL, literal = FALSE, elementFormQualified = FALSE, ...) {

           val = type@toConverter(obj)
           if(length(val) > 1)
             warning("Converting value to primitive SOAP type results in vector with more than one element. Ignoring remainder.")
           newXMLTextNode(val[1], parent = con)
       }

setMethod("toSOAP", c("vector", "XMLInternalElementNode", type = "PrimitiveSchemaType"), tmp)
setMethod("toSOAP", c("vector", "XMLInternalElementNode", type = "SchemaStringType"), tmp)
}


setMethod("toSOAP", c("vector", "XMLInternalElementNode", type = "BasicSchemaType"),
              function(obj, con = xmlOutputBuffer(header = ""), type = NULL, literal = FALSE, elementFormQualified = FALSE, ...) {
                if(length(formals(type@toConverter)))
                   val = type@toConverter(obj)
                else
                   val = as.character(obj)
                
                if(length(val) > 1)
                    warning("Converting value to primitive SOAP type results in vector with more than one element. Ignoring remainder.")
                
                # Do we insert the value or return it and leave to the parent.
                # For the ndfdXMLserver.php, we need to return  val. If we make the text node,
                # we are just putting the scalar value directly into the body.
                # Perhaps we need to recognize that we need to pass a different parent.
                # But it actually works eventhough the Body of the request is dubious.
                #   <NDFDgenByDay>38.9936<latitude xsi:type="xsd:decimal">38.9936</latitude>-77.0224<longitude xsi:type="xsd:decimal">-77.0224</longitude>
                #XXXX

                if(literal)
                   newXMLTextNode(val[1], parent = con)  
                else
                   val[1]

              }
)


setMethod("toSOAP", c("vector", "XMLInternalElementNode", type = "SimpleSequenceType"),
              function(obj, con = xmlOutputBuffer(header = ""), type = NULL, literal = FALSE, elementFormQualified = FALSE, ...) {
                if(length(formals(type@toConverter)))
                   val = type@toConverter(obj)
                else {
                   lapply(obj, function(x) toSOAP(x, con = newXMLNode(type@elType@name, parent = con), type = type@elType, literal = literal, elementFormQualified = elementFormQualified, ...))  # namespaces
                }
              }
)


setMethod("toSOAP", c("vector", type = "SchemaType"),
              function(obj, con = xmlOutputBuffer(header=""), type = NULL,  literal = FALSE, elementFormQualified = FALSE, ...) {
                toSOAPArray(obj, con, type = type, literal = literal, elementFormQualified = elementFormQualified, ...)
              })


 # We need these signatures to be very specific to ensure that these methods and not the one for BasicSOAPType get called.
setMethod("toSOAP", c("vector", con = "XMLInternalElementNode", type = "ArrayType"),
              function(obj, con = xmlOutputBuffer(header = ""), type = NULL, literal = FALSE, elementFormQualified = FALSE, ...) {
                toSOAPArray(obj, con = con, type = type, literal = literal,
                              elementFormQualified = elementFormQualified, ...)
              })
setMethod("toSOAP", c("list", con = "XMLInternalElementNode", type = "ArrayType"),
              function(obj, con = xmlOutputBuffer(header = ""), type = NULL, literal = FALSE, elementFormQualified = FALSE, ...) {
                toSOAPArray(obj, con = con, type = type, literal = literal, elementFormQualified = elementFormQualified, ...)
              })


setMethod("toSOAP", c("ANY", con = "XMLInternalElementNode", type = "Element"),
              function(obj, con = xmlOutputBuffer(header = ""), type = NULL, literal = FALSE, elementFormQualified = FALSE, ...) {
                  #XXX What about the count.
                toSOAP(obj, con, type@type, literal, elementFormQualified, ...)
              })


setMethod("toSOAP", c("ANY", con = "XMLInternalElementNode", type = "LocalElement"),
              function(obj, con = xmlOutputBuffer(header = ""), type = NULL, literal = FALSE, elementFormQualified = FALSE, ...) {
                   # create the local element and then insert the subsequent elements for the type into that.
                node = newXMLNode(type@name, namespaceDefinitions = type@nsuri, parent = con)
                toSOAP(obj, node, type@type, literal, elementFormQualified, ...)
              })
