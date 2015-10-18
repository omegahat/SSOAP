#as.string = as.character

# When we generate an S4 class to represent a SOAP compound data type,
# we have it extend this degenerate class. This allows us to
# provide methods that dispatch on that class such as converting from
# S to SOAP values and vice-verse.
setClass("VirtualSOAPClass", contains = "VirtualXMLSchemaClass")

setClass("SOAPEnvelope",
          representation())

setClass("SOAPActor", representation())


# Representations of different error types that
# can occur in sending a SOAP message.
setClass("SOAPFault",
          representation(message="character",
                         actor="SOAPActor",
                         detail="ANY"))

setClass("SOAPVersionMismatchFault", representation("SOAPFault"))

setClass("SOAPMustUnderstandFault", representation("SOAPFault"))

setClass("SOAPClientFault", representation("SOAPFault"))
setClass("SOAPServerFault", representation("SOAPFault"))

setClass("SOAPGeneralFault", representation("SOAPFault", code="character"))



# Descriptions of SOAP Servers that allow one to connect
# to them.  
setClass("SOAPServer", representation(
                                      host = "character",
                                      port = "integer",
                                      path = "character"),
                       prototype = list(host = "", port = as.integer(NA), path = "" ))


setClass("DynamicSOAPServer", representation(server = "SOAPServer", functions = "list")) # , contains = "SOAPServer")

setClass("HTTPSOAPServer", representation("SOAPServer"))
setClass("HTTPSSOAPServer", representation("HTTPSOAPServer"))

setClass("FTPSOAPServer", representation("SOAPServer"),
           prototype = list(host = "", port = as.integer(NA), url="" ))


# A simple class to represent a complete SOAP action string
# so that we can distinguish it from a regular string.
# Such objects are assumed to be the complete action name
# whereas a regular string will be combined with the
# method name to create the action value.
setClass("SOAPAction", representation("character"))



setClass("WSDLMethod", representation(name="character",
                                      parameters = "list",
                                     # returnValue="SOAPType",
                                      returnValue = "GenericSchemaType",
                                      action="SOAPAction",
                                      namespace="character",
                                      bindingStyle = "character", # rpc or document.
                                      use = "character",          # literal or encoded
                                      documentation = "character",
                                      header = "ANY", #XXX
                                      returnNodeName = 'character', # name of the node that contains
                                                                   # the result's payload. See getReturnNode.
                                      numPartElements = "integer"
                                     ),
                       prototype = list(bindingStyle = as.character(NA),
                                        use = c(input = as.character(NA), output = as.character(NA)),
                                        documentation = as.character(NA)))



setOldClass("connection")


# Stores the output from a SOAP request, i.e. the resulting HTTP message
# This contains both the HTTP hearder info and the payload.
setClass("SOAPResult", representation(header="list", content = "character"))


# Meta information (typically) read from a WSDL file that defines
# the properties of a SOAP server. This includes how to find the server
# the methods and any new types it defines for its purposes.
#
setClass("SOAPServerDescription", representation(name = "character",
                                      server = "SOAPServer",
                                      operations = "list",
                                      types = "list",
                                      nameSpaces = "character",  # which SOAP namespaces to use 1.1 or 1.2
                                      verb = "character"  # soap11, soap12, GET, PUT, RPC -  corresponding to how we communicate the SOAP requests
                                     ))


setClass("WSDLGeneratedSOAPFunction", contains = "function")

setGeneric("help",
           function (topic, offline = FALSE, package = NULL, lib.loc = NULL, 
    verbose = getOption("verbose"), try.all.packages = getOption("help.try.all.packages"), 
    chmhelp = getOption("chmhelp"), htmlhelp = getOption("htmlhelp"), 
    pager = getOption("pager"))
           standardGeneric("help"))

setMethod("help", "WSDLGeneratedSOAPFunction",
           function (topic, offline = FALSE, package = NULL, lib.loc = NULL, 
    verbose = getOption("verbose"), try.all.packages = getOption("help.try.all.packages"), 
    chmhelp = getOption("chmhelp"), htmlhelp = getOption("htmlhelp"), 
    pager = getOption("pager"))
         cat(environment(topic)$.operation@documentation))



setClass("WSSEAuth", representation(username = "character", password = "character",
                                    required = "logical"),
           prototype = list(required = TRUE))
