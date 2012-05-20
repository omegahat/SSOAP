getHTTPContent <-
  #
  # Reads the lines from the HTTP response 
  # header and converts them into a
  # name=value  collection as a character vector.
  #
function(lines)
{
 if(length(lines) < 1)
   return(NULL)

  # Not able to use read.dcf() here since we would have to write
  # these lines to a file. Use a textConnection?
  # header <- paste(lines[1:(b[1]-1)], collapse="\n")
  # header <- read.dcf(header) 
 b <- (1:length(lines))[lines  == ""]

 els <- sapply(lines[2:(b[1]-1)], function(x) strsplit(x, ":"))
 header <- sapply(els, function(x) x[2])
 names(header) <- sapply(els, function(x) x[1]) 

 els <- strsplit(lines[1], " ")[[1]] 
 header[["status"]] <- as.integer(els[2])
 header[["statusMessage"]] <- els[3]
 
  # Now paste the content or payload of the HTTP communication
 content <- paste(lines[(b[1]+1):length(lines)], collapse="\n")

 return(list(header = header, content = content))
}


.SOAP <-
  #
  # Uses sockets to do HTTP. Need to use blocking = FALSE
  # and then loop reading the available contents of the connection
  # until we know the end of the message has arrived. Much easier  to 
  # leave it to RCurl.
  #
function(server, method, ..., action, nameSpaces = SOAPNameSpaces(), xmlns = NULL,
          handlers = SOAPHandlers(), .types = NULL, .convert = TRUE, debug = FALSE)  
{
  # Get the connection.
 if(debug) {
   con <- textConnection(".SOAPTest", "w", local = TRUE)
 } else {
   con <- socketConnection(server@host, port = server@port, open = "w+", blocking = TRUE)
 }
 on.exit(close(con))

 if(is.null(xmlns))
   xmlns <- c(namesp1 = action)

 if(!is(action, "SOAPAction") && !is.null(handlers) && !is.na(match("action", names(handlers)))) 
   action <- handlers[["action"]](action, method, server, xmlns)
 
 writeSOAPHeader(server@url, server@host, action, con)

 txt <- writeSOAPMessage(con, ..., nameSpaces = nameSpaces, method = method, .types = .types, xmlns = xmlns)

 cat("Content-Length: ", nchar(txt),"\r\n", sep="", file=con)
 cat("\r\n", file=con)
 cat(txt, sep="\n", file=con)

 cat("\n", file=con)
 
 if(debug) {
   return(.SOAPTest)
 }


  # Now read the response from the server.
 txt <- readLines(con) 

  # Parse this into the HTTP header and the payload. 
 content <- getHTTPContent(txt)

  # Check things were ok with the HTTP.
 if(isHTTPError(content$header)) {
     # This would be the exception that we throw if we had an exception system.
   fault <- SOAPFault(parseSOAP(content$content, asText = TRUE))
    # 
   stop("Error occurred in the HTTP request: ", fault@message, fault@detail)
   return(fault)
 }

 cat("Converting result\n")

 if(is.logical(.convert) && .convert && !is.null(handlers) && !is.na(match("result", names(handlers))))
   return(handlers[["result"]](content$content,  content$header, method))
 else if(is.function(.convert))
   return(.convert(content))
 else if(is(.convert, "SOAPType")) {
   return(convertFromSOAP(SOAPResult(content$content, content$header), .convert))
 }

 return(content)
}


writeSOAPHeader <-
#
#  This is the HTTP header, not the header of the SOAP contents.
#

function(url, host, action, con, ...)
{
 cat("POST /", gsub("^/", "", url), " HTTP/1.1\r\n", sep="", file=con)
 cat("Host: ", host, "\r\n", sep="", file=con)
 cat("Content-Type: text/xml; charset=utf-8\r\n", file=con)
 if(!is.null(action))
   cat("SOAPAction: \"", action, "\"\r\n", sep="", file=con)

 args <- list(...)
 for(i in names(args)) {
    cat(i, ": ", args[[i]], sep="", file=con)
 }

}
