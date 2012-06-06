.SOAP <-
function(server, method, ..., .soapArgs = list(), action, nameSpaces = SOAPNameSpaces(), xmlns = NULL,
         handlers = SOAPHandlers(), .types = NULL, .convert = TRUE,
         .opts = list(), curlHandle = getCurlHandle(),
         .header = getSOAPRequestHeader(action, .server = server),
         .literal = FALSE, .soapHeader = NULL, .elementFormQualified = FALSE,
         .returnNodeName = NA)
{

 if(is.null(xmlns))
   xmlns <- c(namesp1 = action)

 if(!is(action, "AsIs")) {
   if((!is(action, c("SOAPAction")) || action == "") && !is.null(handlers) && "action" %in% names(handlers)) 
      action <- handlers[["action"]](action, method, server, xmlns)
 }

 useNodes = TRUE
 
 if(useNodes)
   doc =  newXMLDoc()
 else
   doc <- textConnection(".foo", open = "w", local = TRUE)

# if(!is.null(.wsse)) 
#    .soapHeader = addWSSE(.wsse, .soapHeader)

 
 writeSOAPMessage(doc, ..., nameSpaces = nameSpaces, method = method, 
                    .soapArgs = .soapArgs, .types = .types, xmlns = xmlns, .literal = .literal,
                     .soapHeader = .soapHeader, .elementFormQualified = .elementFormQualified)
 if(useNodes)
   txt <- as(doc, "character")
 else {
   close(doc)
   txt = textConnectionValue(doc)
   close(doc)
 }

# Curl specific
 headerDataFun = basicTextGatherer()
 bodyDataFun = basicTextGatherer()  

 if(is(server, "CURLHandle") && missing(curlHandle) )
   curlHandle = server
 else 
   .opts$url = toURL(server)

 if(length(.header))
   .opts$httpheader = .header

 curlPerform(postfields = txt,
             writeFunction = bodyDataFun$update,
             headerFunction = headerDataFun$update, 
             .opts = .opts, curl = curlHandle)

# end of Curl specific part.
 
 content = structure(
              list(header = RCurl:::parseHTTPHeader(headerDataFun$value(NULL)),
                   content = bodyDataFun$value()),
              class = "SOAPHTTPReply"
              )

 if(isHTTPError(content$header) || isSOAPBodyError(content$content)) {

   fault <- SOAPFault(parseSOAP(content$content, asText = TRUE))
     # Now create a customized exception.
   e = simpleError(paste("Error occurred in the HTTP request: ", fault@message, xmlValue(fault@detail)))
   httpError = RCurl:::getHTTPErrorClass(content$header[["status"]])
   class(e) = c( "SOAPError",  httpError, class(e))
   stop(e)
   return(fault)
 }


 if(is.logical(.convert) && .convert && !is.null(handlers) && !is.na(match("result", names(handlers))))
   handlers[["result"]](content$content,  content$header, method)
 else if(is.function(.convert)) 
    return(if(inherits(.convert, "RawSOAPConverter"))
              .convert(content)
           else
              .convert(getReturnNode(content))
         )
  else if(is(.convert, "GenericSchemaType"))  # was "SchemaType" but want to include Element.
     convertFromSOAP(SOAPResult(content$content, content$header), .convert, nodeName = .returnNodeName)
  else if(is.character(.convert))
       as(getReturnNode(content), .convert)
  else
       return(content) 
}


isSOAPBodyError =
function(doc)
{
   if(is.character(doc))
     doc = xmlParse(doc, asText = TRUE)

   length(getNodeSet(doc, "//env:Body/env:Fault", c(env="http://schemas.xmlsoap.org/soap/envelope/"))) > 0
}


addWSSE =
function(wse, header)
{
  if(is.null(header))
    header = newXMLDoc()
}


toURL =
  #
  # Get the URL string from a SOAPServer object.
  #
function(server)
{
 if(is.character(server))
   return(server)

 port = character(0)
 if(!is.na(server@port) && server@port != 0 )
   port = as.character(server@port)
 
 url = paste(getProtocol(server), server@host, 
              ifelse(length(port), paste(":", port, sep = ""), ""),
              ifelse(substring(server@path, 1, 1) == "/", "", "/"),
              server@path, sep="")

 url
}


setGeneric("getProtocol",
function(server, ...)
  standardGeneric("getProtocol"))

setMethod("getProtocol", "HTTPSSOAPServer",
function(server, ...)          
   "https://"
)

setMethod("getProtocol", "HTTPSOAPServer",
function(server, ...)          
   "http://"
)

setMethod("getProtocol", "SOAPServer",
function(server, ...)          
   "http://"
)

setMethod("getProtocol", "FTPSOAPServer",
function(server, ...)          
   "ftp://"
)

getSOAPRequestHeader =
function(action, ...,
         defaultHeader = c(Accept="text/xml", Accept="multipart/*",
                           'Content-Type' = "text/xml; charset=utf-8"),
         .server = NULL)
{

   httpHeader= defaultHeader
     # Put the action in quotes.
   httpHeader["SOAPAction"] = paste('"', action, '"', sep="")

   httpHeader
}




.onLoad <-
function(lib, pkg)
{
 options("SSOAP:DefaultNamespace" = "1.2")
}
