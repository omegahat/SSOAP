testGet <-
function(url = "TimeService/TimeService.asmx", host = "www.nanonull.com",
         action = "http://www.Nanonull.com/TimeService/getTimeZoneTime",
         debug = FALSE, method = "getTimeZoneTime", ...)  
{

 if(debug)
   con <- textConnection(".SOAPTest", open="w")
 else {
   con <- socketConnection(host, port = 80, open = "w+", blocking = TRUE)
   on.exit(close(con))
 }

 cat("GET /", url, "/", method, file=con, sep="")
 args <- list(...)
 for(i in names(args))
   cat("?", i, "=", args[[i]], file=con, sep="")
 cat(" HTTP/1.1\n", sep="", file=con)
 cat("Host: www.nanonull.com\n\n\n\n", file=con)

 
 if(debug) {
   close(con)
   return(paste(get(".SOAPTest"), collapse="\n"))
 }

 txt <- readLines(con)

 txt
}


#  "urn:soapinterop"
#   '<m:echoString xmlns:m="http://soapinterop.org/">',
#   '<inputString xsi:type="xsd:string">DIS</inputString>',
#   '</m:echoString>',

test <-
function(url = "TimeService/TimeService.asmx", host = "www.nanonull.com",
         action = "http://www.Nanonull.com/TimeService/getTimeZoneTime",
         debug = FALSE, ...)
{

  # If debugging, use a text connection and write the HTTP request
  # to that, and then return.
 if(debug)
   con <- textConnection(".SOAPTest", open="w")
 else {
   con <- socketConnection(host, port = 80, open = "w+", blocking = TRUE)
   on.exit(close(con))
 }


  # The HTTP request header information
 writeSOAPHeader(url, host, action, con)

  # The basic SOAP envelope
 writeSOAPEnvelope(con, SOAPNameSpaces)
 cat('<SOAP-ENV:Body>\n', file=con)

  #
 cat('<getTimeZoneTime xmlns="http://www.Nanonull.com/TimeService/">\n',file=con)
 cat('<timezone>GMT</timezone>\n',file=con) 
 cat('</getTimeZoneTime>\n', file = con)

 cat("</SOAP-ENV:Body>\n", file=con) 
 cat("</SOAP-ENV:Envelope>\n", file=con)

 cat("\n\n", file=con)
 

 if(debug) {
   close(con)
   return(paste(get(".SOAPTest"), collapse="\n"))
 }

  # Now read the response from the server.
 txt <- readLines(con) 

  # Parse this into 
 content <- getHTTPContent(txt)

 content
}  
