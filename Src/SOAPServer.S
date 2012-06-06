#
# x <- SOAPServer(url = "TimeService/TimeService.asmx", host = "www.nanonull.com")
# SOAPServer("www.omegahat.org", "/foo")
#

SOAPServer <-
  #
  # className is computed from the host and s is evaluated very lazily.
  #
function(host, url, port = NA,  s = new(className))
{

 if(missing(url)) {
   u = parseURI(host) # From XML package
   if(missing(port))
     port = u$port
   if(!is.na(port) && port == 0)
     port = NA
   protocol = u$scheme
   url <- u$path
   host <- u$server

 } else
    protocol = gsub("^(.+):.*", "\\1", host)

  className = switch(protocol, http = "HTTPSOAPServer",
                     https = "HTTPSSOAPServer",
                     ftp = "FTPSOAPServer",
                     "SOAPServer")

 s = new(className)
 s@host <- host

 s@path <- url

  #  if(!missing(port))    really want  missing value here.        
 s@port <- as.integer(port)
 
 s
}  



setMethod("$", c("SOAPServer"),
          function(x, name) {

            function(...) {

              .SOAP(x, method = name, ...)
            }
          })

