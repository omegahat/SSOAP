setMethod("writeSOAPEnvelope", "XMLInternalDocument",
          function(con, nameSpaces = SOAPNameSpaces()) {

            if(is(nameSpaces, "character") && length(nameSpaces) == 1 && nameSpaces %in% names(.SOAPDefaultNameSpaces))
              nameSpaces = .SOAPDefaultNameSpaces[[nameSpaces]]
            else if(length(nameSpaces) == 1 && is.na(nameSpaces))
              nameSpaces = SOAPNameSpaces()
            
            newXMLNode("SOAP-ENV:Envelope",
                        namespaceDefinitions = nameSpaces,
                         attrs = c('SOAP-ENV:encodingStyle' = "http://schemas.xmlsoap.org/soap/encoding/"),
                         doc = con)
          })

writeSOAPHeader =
function(info, parentNode)
{
   if(is.function(info))
     info(parentNode)
}

setMethod("writeSOAPBody", c(con = "XMLInternalDocument"),
function(method, ..., xmlns= NULL, con,
          .types = NULL, .soapArgs = list(),
          .literal = FALSE,
          .header = NULL, .elementFormQualified = FALSE)
{

   if(!is.null(.header))
     writeSOAPHeader(.header, con)

   envelope = xmlRoot(con)

   b = newXMLNode("SOAP-ENV:Body", parent = envelope)
      # xmlns is the value of the URI for the default namespace for this node.
      # e.g. SOAP/KEGG.
      # This comes from <operation> node in the WSDL along with the use = encoded and encodingStyle attributes.
   methodCall = newXMLNode(method, parent = b, doc = con)

   if(length(xmlns) && xmlns != "") {
     if(length(names(xmlns)) == 0 && (is.na(.elementFormQualified) || .elementFormQualified == FALSE))
       names(xmlns) = "ns"
     
      newXMLNamespace(methodCall, xmlns, set = TRUE)
   }


      # Process the argument values.
   argValues = fixSOAPArgNames(list(...), .soapArgs)
   argNames = names(argValues)
   
   argNodes =
     lapply(seq(along = argValues),
              function(i) {
                argName <- argNames[i]

                typedef = NULL
                if(length(.types) >= i ) {
                  typedef = .types[[i]]
                  type = getSOAPType(typedef, argValues[[i]])
                } else
                  type = getSOAPType(argValues[[i]])


                if(!.literal) {
                  ans = newXMLNode(argName, parent = methodCall,
                                   attrs = if(length(type) && type[1] != "")
                                               writeTypes(argValues[[i]], con = con, types = type),
                                   doc = con)
                  if(length(xmlns) && xmlns != "")
                      newXMLNamespace(ans, xmlns, set = TRUE)
                }
                toSOAP(argValues[[i]], if(!.literal) ans else methodCall, type = typedef,
                              literal = .literal, elementFormQualified = .elementFormQualified)

                NULL                
              })

#   addChildren(methodCall, kids = argNodes)

   b
})


fixSOAPArgNames =
function(args, .soapArgs)
{
   # Now we are moving onto the parameters for the call.
 args <- merge.list(args, .soapArgs)

 if(length(args) == 0)
   return(args)
 
 argNames <- names(args)
 
   # Patch up argument names if necessary.
   # If none, make them up as a1, a2, a3,
 if(is.null(argNames)) {
   argNames <- paste("arg", seq(along = args), sep="")
 } else {
     # If there are any missing, add them as arg1, arg2, ...
   which = argNames == ""
   if(any(which))
      argNames[which] <- paste("arg", 1:sum(which), sep="")
 }

 structure(args, names = argNames)
}
