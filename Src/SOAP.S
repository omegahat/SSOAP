   # Create XML to invoke a SOAP method

"writeTypes" =
function(x, con, types = getSOAPType(x))
{  
    if(!is.null(types)) {

      if(is(types, "ArrayType")) {
        tmp = getSOAPType(types)
#        tmp = paste("xsi:type=\"SOAP-ENC:Array\" SOAP-ENC:arrayType =\"",  getSOAPType(types@elType), "\"", collapse = "")
      } else {
#        tmp = paste(names(types), paste("\"", types, "\"", sep=""), sep="=", collapse= " ")        
        tmp = types
      }

      if(is(con, "connection"))
        cat(paste(tmp, collapse = " "), file=con)
    }
     
    tmp
}





setGeneric("getSOAPType", function(obj, value = NULL) standardGeneric("getSOAPType"))

setMethod("getSOAPType", "ANY",
function(obj, value = NULL)
{
  if(is.null(obj)) #XXX || length(obj) == 0)
    return(XMLSchemaTypes[["NULL"]][["xsi:type"]])

  ans <- character(0)
  
  if(length(obj) > 1) {
         # Array
    n <- length(obj)
    same <- sapply(obj, function(x, target) typeof(x) == target, target = typeof(obj[[1]]))

     ans <- c("xsi:type"="SOAP-ENC:Array")
    if(all(same)) {
      type <- getSOAPType(obj[[1]])
      ans["SOAP-ENC:arrayType"]  = paste(type[1], "[", n, "]", sep="")
    }
  } else {
    #XXX?!?!?!
     m <- typeof(obj)
     ans["xsi:type"] <- XMLSchemaTypes[[m]][["xsi:type"]]
  }
  
  return(ans)  
})

setMethod("getSOAPType", "PrimitiveSchemaType",
function(obj, value = NULL) {
  c("xsi:type" = paste(obj@ns, obj@name, sep=":"))
})


setMethod("getSOAPType", "ArrayType",
function(obj, value = NULL) {
    ans <- c("xsi:type"="SOAP-ENC:Array")

    if(!is.null(value))  {
      n = length(value)
      type <- getSOAPType(value[1])
    } else {
       n = ""
       type="ur-type"
    }
    ans["SOAP-ENC:arrayType"]  = paste(type[1], "[", n, "]", sep="")

    ans
})


SOAPAction =
  # Constructor for a SOAPAction object typically read from a WSDL file.
function(x, obj = new("SOAPAction"))
{
  as(obj, "character") = x

  obj
}


.SOAPAction <-
function(action, method, server, xmlns, sep="#")
{
  if(missing(sep)) {
    if(substring(action, nchar(action)) == "#" || substring(method, 1, 1) == "#")
      sep=""
  }

  if(action == "")
    action = xmlns
  
  paste(action, sep, method, sep="")
}

.SOAPDefaultHandlers <-
  list(action = .SOAPAction,
       result = function(xmlSource, header, method, server) {
         response <- parseSOAP(xmlSource, asText = TRUE)
         fromXML(response[[1]])
       })

SOAPHandlers <-
function(..., include = character(0), exclude = character(0))
{  
 defaults <- .SOAPDefaultHandlers
 els <- list(...)

 .merge(els, defaults, include, exclude)
}



SOAPResult =
function(content, header, obj = new("SOAPResult"))
{
 obj@content = content
 obj@header = as.list(header)
 obj
}


writeSOAPMessage <-
function(con, ..., nameSpaces, method, 
          .types = NULL, xmlns = NULL, .soapArgs = list(),
          .literal = FALSE, .soapHeader = NULL, .elementFormQualified = FALSE)
{
  #XXX make this anonymous!
  ownCon = FALSE
  if(is.null(con)) {
     con <- textConnection(".foo", open="w", local = TRUE)
     ownCon <- TRUE
  }

 writeSOAPEnvelope(con, nameSpaces = nameSpaces)

 if(!is.null(.soapHeader)) {
   tmp = NULL
   if(is.function(.soapHeader))
      tmp = .soapHeader(con, method)
   else if(is(.soapHeader, "XMLAbstractNode"))
      tmp = .soapHeader
   else if(is.character(.soapHeader))
      tmp = xmlInternalTreeParse(.soapHeader, asText = TRUE)
   else
      tmp = as(.soapHeader, "XMLInternalNode")

   if(!is.null(tmp)) {
     if(is(con, "XMLInternalDocument")) {
          # Add this node to the document.
          # or we could use envelope = xmlRoot(con)
        envelope = con[["//SOAP-ENV:Envelope"]]
        node = as(tmp, "XMLInternalNode")
        if(xmlName(node) != "Header")
          newXMLNode("SOAP-ENV:Header", node, parent = xmlRoot(con))
        else
          addChildren(envelope, node)
     } else if(is(con, "connection"))
        cat(as(tmp, "character"), file = con)
   }
 }

  
 writeSOAPBody(method, ..., .soapArgs = .soapArgs, xmlns = xmlns, con = con,
                .types = .types, .literal = .literal, .elementFormQualified = .elementFormQualified)

 if(is(con, "connection")) {
    cat("</SOAP-ENV:Envelope>\r\n", file=con)
    cat("\r\n", file=con)
 }
  # Since we didn't open this connection
 if(is(con, "connection")) {
   if(ownCon) {
     on.exit(close(con))
                                        # Can we just access .foo here directly.   
     paste(textConnectionValue(con), collapse="\n")
   } else {
     flush(con)
     con
   }
 }

  con
}  


addWSSEHeader =
function(info, envelope)
{

}

#SOAP 1.1
#      "SOAP-ENC" = 'http://schemas.xmlsoap.org/soap/encoding/',
#      "xsd" = 'http://www.w3.org/1999/XMLSchema',
# SOAP  1.2 
#      "SOAP-ENV" = 'http://www.w3.org/2001/06/soap-envelope',
#      "SOAP-ENC" = 'http://www.w3.org/2001/06/soap-encoding',
#      "xsd" = 'http://www.w3.org/2001/XMLSchema',

.SOAPDefaultNameSpaces <-
  list("1.1" = 
         c(
           'SOAP-ENC'="http://schemas.xmlsoap.org/soap/encoding/",
           'SOAP-ENV'="http://schemas.xmlsoap.org/soap/envelope/",           
           'xsi'="http://www.w3.org/1999/XMLSchema-instance",
           'xsd'="http://www.w3.org/1999/XMLSchema"
           )  ,
       "1.2" = 
         c(
           'SOAP-ENC'="http://schemas.xmlsoap.org/soap/encoding/", #          'SOAP-ENC'="http://www.w3.org/soap-encoding/",
           'SOAP-ENV'="http://schemas.xmlsoap.org/soap/envelope/",                      
#XXX       'SOAP-ENV'="http://www.w3.org/2001/06/soap-envelope",
           'xsi'="http://www.w3.org/2001/XMLSchema-instance",
           'xsd'="http://www.w3.org/2001/XMLSchema"
           )  )       
       

.merge <-
function(els, defaults, include = NULL, exclude = NULL)
{
 if(length(els) > 0) {
   which <- match(names(defaults), names(els))
   if(any(!is.na(which)))
     els[names(defaults)[!is.na(which)]] <- defaults[!is.na(which)]
 } else
   els <- defaults

 if(length(include)) {
   els <- els[include]
 } else if(length(exclude)) {
   which <- match(exclude, names(els))
   if(any(!is.na(which)))
     els <- els[- (which[!is.na(which)])]
 }

 els   
}  

SOAPNameSpaces <-
function(..., include = character(0), exclude = character(0), version = getOption("SSOAP:DefaultNamespace"))
{
  # If version doesn't match an entry, then use NULL rather than raising an error.
  #  if(!(version %in% names(.SOAPDefaultNameSpaces))) 
  #     stop("Incorrect SOAP name space version: ", version)

  defaults <- .SOAPDefaultNameSpaces[[version]]
  els <- sapply(list(...), as.character)
  .merge(els, defaults, include, exclude)
}

  # This and writeSOAPBody should use the XMLOutput.. classes in the XML package.

setGeneric("writeSOAPEnvelope",
           function(con, nameSpaces = SOAPNameSpaces())
           standardGeneric("writeSOAPEnvelope"))

setMethod("writeSOAPEnvelope", "connection",
function(con, nameSpaces = SOAPNameSpaces())
{
  if(is(nameSpaces, "character") && length(nameSpaces) == 1 && nameSpaces %in% names(.SOAPDefaultNameSpaces))
     nameSpaces = .SOAPDefaultNameSpaces[[nameSpaces]]
  else if(length(nameSpaces) == 1 && is.na(nameSpaces))
     nameSpaces = SOAPNameSpaces()
  
  cat("<?xml version='1.0' encoding='UTF-8'?>\r\n", file = con)
#  cat("<?xml version='1.0'?>\r\n", file = con)  
  cat("<SOAP-ENV:Envelope\r\n", file=con)
  for(i in names(nameSpaces)) {
     cat("   xmlns:", i, "=\"", nameSpaces[i],"\"\r\n", sep="", file=con)
  }
  cat('   SOAP-ENV:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"', file=con)
  cat(">\r\n", file=con)
})



if(FALSE) 
writeSOAPHeader =
  #
  # XXX replaced by a version in nativeWrite.R
  #
function(info, con)
{
  if(is.null(info))
    return(character())

  if(is(info, "character")) {
    cat(info, file = con)
    return(TRUE)
  }
  
  txt = character()
  
  if(is.function(info))
    txt = info()
  
   #xxx
  if(length(txt))
    cat("<SOAP-ENV:Header>\n", txt, "\n</SOAP-ENV:Header>\n", file = con)
}



setGeneric("writeSOAPBody",
           function(method, ..., xmlns= NULL, con,
                    .types = NULL, .soapArgs = list(),
                    .literal = FALSE,
                    .header = NULL, .elementFormQualified = FALSE)
            standardGeneric("writeSOAPBody"))




 
getReturnNode <-
function(node, name = "return")
{
   if(inherits(node, "SOAPHTTPReply")) 
      node = parseSOAP(node$content, asText = TRUE)
   else if(is.character(node))
      node = parseSOAP(node, asText = TRUE)

   if(is.na(name))
       name = "return"
   
   orig = node

   if(xmlName(node) == name)
     return(node)
   
   tmp = getNodeSet(node, sprintf("//%s", name))

   if(length(tmp) == 0) 
     return(orig[[1]]) #Was orig      # Give back the original node.
  
   tmp[[1]]
}
