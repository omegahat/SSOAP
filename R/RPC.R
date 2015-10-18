# Some examples, some of which work and some of which don't
# but are here so we can try things.  Any more suggestions of
# servers and methods that I can use to test the code would
# very much appreciated.

#
#.XMLRPC("http://betty.userland.com:80/RPC2", "examples.getStateName", as.integer(41))
# .XMLRPC("http://betty.userland.com:80/RPC2", "examples.getStateList", as.integer(c(1, 4, 45, 6)))
#  http://www.latenightsw.com/freeware/XMLTools2/xml-rpc.html

# .XMLRPC("http://xmlrpc-c.sourceforge.net/api/sample.php", "sample.sumAndDifference", as.integer(2), as.integer(4))


# z = .XMLRPC("http://time.xmlrpc.com/RPC2", "currentTime.getCurrentTime")

# .XMLRPC("http://rpc.geocoder.us/service/xmlrpc/RPC2", "geocode","1600 Pennyslvania Avenue, Washington DC")


# .XMLRPC( "http://db.systemsbiology.net:8080/cytoscape/dreiss/xmlrpc", "interaction.getAllInteractionsAndInfo", 'USER',"PASS", 'NP_524542', 'Drosophila melanogaster', 'curagen', TRUE )
# .XMLRPC( "http://db.systemsbiology.net:8080/cytoscape/dreiss/xmlrpc", "server.listServiceCommands", "interaction" )

################################################################################################
#
# The top-level function for making  an XML-RPC call to a server.#
# Give the URI of the server, e.g. http:/....
#  and the method name and any arguments for the method.
#
# .opts allows for specifying options to control the curl handle
#  write is a function or RCurlCallbackFunction for collecting the response.
#  If a function is given, then that is responsible for processing the
#  response.
# .convert = a function for processing the XML in the result.
#
.XMLRPC =
function(server, method, ..., .opts = list(), write = basicTextGatherer(),
          .convert = xmlRPCResult, curl = getCurlHandle())
{
  returnWriter = FALSE
  if (missing(write) || inherits(write, "RCurlCallbackFunction")) {
        writeFun = write$update
  }
  else {
        writeFun = write
        returnWriter = TRUE
  }

 cmd = paste('<?xml version="1.0"?>\\r\\n<methodCall><methodName>', method, '</methodName>', sep = "")
 args = list(...)
 if(length(args)) 
   params = paste("<param>", createRPCArguments(args), "</param>", sep = "", collapse = "")
 else params = ""
  # Should we put this in even if length(args) == 0
 cmd = paste(cmd, "<params>", params, "</params>", sep = "\n")
 cmd = paste(cmd, '</methodCall>', sep = '\n')

  
 curlPerform(url = server,
             postfields = cmd,
             writefunction = writeFun,
             verbose = TRUE,
             httpheader = c("Content-Type" = "text/xml", "User-Agent" = "R"),
             .opts = .opts, curl = curl)

  status = getCurlInfo(curl)
  if(as.integer(status$response.code /100) != 2) {
      stop("Problems in xml-rpc call for ", method, " in ", server)
  }
  
  if (returnWriter) 
     return(write)
  ans = write$value()

  if(missing(.convert) &&   (status$content.type != "text/xml")) {
    warning("XML-RPC result is not XML-based")
    return(ans)
  }
  
  if(is.function(.convert))
    ans = .convert(ans, call = sys.call())

  ans
}


####################################################################
# Convert the R values to XML-RPC arguments.

createRPCArguments =
function(els)
{
  sapply(els, createRPCValue)
}

createRPCValue =
function(x)
{
  UseMethod("createRPCValue")
}

typeNameMap =
 c("character" = "string",
   "numeric" = "double",
   "logical" = "boolean",
   "integer" = "int"
)

createRPCValue.default =
function(x)
{
  if(length(x) > 1) {
    createRPCArray(x)
  } else {
    id = typeNameMap[typeof(x)]
    paste("<", id, ">", x, "</", id, ">", sep = "")
  }
}

createRPCArray =
  #
  # Create an XML-RPC array.
  #
function(x)
{
  paste("<array>",
        paste(sapply(x, createRPCValue), collapse = "\n"),
        "</array>", sep = "\n")
}

########################################################################
# For converting the result back to R.

xmlRPCHandlers =
  #
  # handlers that are used on-the-fly when parsing the XML
  # result from the query.  These convert the basic types into 
  # R objects.
  #
function(call)
{
  list(dateTime.iso8601 = function(node) {
                            list(strptime(xmlValue(node), "%Y%m%dT%H:%M:%S"))
                         },
        i4 = function(x) as.integer(xmlValue(x)),
        int = function(x) as.integer(xmlValue(x)),
        double = function(x) as.numeric(xmlValue(x)),
        boolean = function(x) as.logical(xmlValue(x)),
        string = xmlValue,

        struct = function(node) {
                         els = node[names(node) == "member"]
                         ans = lapply(els, function(member) member[["value"]])
                         names(ans) = sapply(els, function(member) xmlValue(member[["name"]]))
                         list(ans)
                       },
        base64 = function(node) xmlValue(node),  #XXX not yet.
        array = function(node) xmlChildren(node[["data"]]),
        param = function(node) node[["value"]][[1]],
        value = function(x) {
                             a = xmlChildren(x)
                             return(a[[1]])
                             #XXX
                             if(length(a) == 1 && class(a[[1]]) == "list")
                               a[[1]]
                             else
                                a
                           },
        fault = function(node) {
                     # Create the error object. Throw it when interpreting the result.
                     e = node[[1]][[1]]
                     m = e[["faultString"]]
                     if(inherits(m, "XMLNode"))
                       m = xmlValue(e[["faultString"]])
                     else
                       m = as.character(m)
                     msg = list(message = m, call = call, code = e[["faultCode"]])
                     class(msg) = "XMLRPCError"

                     return(msg)
                   }
      )
}  



xmlRPCResult =
function(txt, handlers = xmlRPCHandlers(call), simplify = TRUE, call = sys.call())
{
  r = xmlRoot(xmlTreeParse(txt, asText = TRUE, handlers = handlers, asTree = TRUE))
  if(inherits(r[[1]], "XMLRPCError")) {
      # error in the request, report the fault.
    e = simpleError(r[[1]]$message, call)
    class(e) = c("XMLRPCError", class(e))
    stop(e)
  }

   # Get the answer.
  ans = xmlChildren(r[["params"]])
  if(simplify && length(ans) == 1 && class(ans) == "list") {
    ans = ans[[1]]
    if(inherits(ans, "XMLNode"))
       ans = xmlChildren(ans)
  } 

  ans
}

