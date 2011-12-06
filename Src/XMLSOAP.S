SOAPCall <-
function(method, ..., types = NULL, out = xmlTree())  
{
  # xmlOutputBuffer, xmlOutputTree, xmlTree
#   out <- xmlOutputBuffer(nameSpace = c(SOAP="http://schemas.xmlsoap.org/soap/envelope/"))
#  out <- xmlOutputDOM(nameSpace = c(SOAP="http://schemas.xmlsoap.org/soap/envelope/"))
#  out <- xmlTree(namespaces = list(SOAP="http://schemas.xmlsoap.org/soap/envelope/"))


  out$addTag("Body", close= FALSE)

   out$addTag(method, close= FALSE)
   args <- list(...)
   ctr <- 1
   for(i in 1:length(args)) {
     attrs <- c("xsi:type" = "myType")
     out$addTag(names(args)[i], attrs = attrs, close = FALSE)
       toSOAP(args[[i]], out)
     out$closeTag()
   }
   out$closeTag()
  
#  out$closeTag()

  out$value()
}
