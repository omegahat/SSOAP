pkgname <- "SSOAP"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
library('SSOAP')

assign(".oldSearch", search(), pos = 'CheckExEnv')
cleanEx()
nameEx("SOAP")
### * SOAP

flush(stderr()); flush(stdout())

### Name: .SOAP
### Title: Invoke a SOAP method
### Aliases: .SOAP
### Keywords: interface connection

### ** Examples

## Not run: 
##D .SOAP(SOAPServer("services.xmethods.net", "soap"),
##D        "getRate", country1="England", country2 = "Japan",
##D        action="urn:xmethods-CurrencyExchange")
##D 
##D .SOAP(SOAPServer("services.xmethods.net", "soap/servlet/rpcrouter"),
##D       "getPrice", "0596000278",
##D       action="urn:xmethods-BNPriceCheck")
##D 
##D s <- SOAPServer("http://services.xmethods.net/soap")
##D .SOAP(s,
##D       "getQuote", "AMZN",
##D       action="urn:xmethods-delayed-quotes#getQuote")
##D 
##D 
##D .SOAP(SOAPServer("services.soaplite.com", "temper.cgi"),
##D        "c2f", 37.5,
##D       action="http://www.soaplite.com/Temperatures")
##D 
##D 
##D  # Different action and namespace.
##D  # Specify handlers=NULL to avoid the additional processing of the
##D  # SOAPAction string, i.e. the appending of the method name.
##D  # This kills off all the handlers. If we want to remove only the
##D  # "action" element, we have to be more explicit.
##D 
##D s1 <- SOAPServer("services.soaplite.com", "interop.cgi")
##D .SOAP(s1,
##D       "echoString", "From R",
##D       action="urn:soapinterop",
##D       xmlns=c(namesp1="http://soapinterop.org/"),
##D       handlers =NULL)
## End(Not run)



cleanEx()
nameEx("SOAPHandlers")
### * SOAPHandlers

flush(stderr()); flush(stdout())

### Name: SOAPHandlers
### Title: Get SOAP function handlers
### Aliases: SOAPHandlers
### Keywords: interface connection

### ** Examples

 SOAPHandlers()
 SOAPHandlers(action = function(action, method, server, xmlns) action)

 SOAPHandlers(exclude="action")



cleanEx()
nameEx("SOAPHttpGet")
### * SOAPHttpGet

flush(stderr()); flush(stdout())

### Name: .SOAPHttpGet
### Title: Functions for making SOAP calls via HTTP GET or POST requests
### Aliases: .SOAPHttpGet .SOAPHttpPost
### Keywords: programming interface

### ** Examples


 .SOAPHttpGet("http://www.chemspider.com/MassSpecAPI.asmx/SearchByMass2", mass = 89.0476, range = 0.01)

## Not run: 
##D     # need token
##D   .SOAPHttpGet("http://www.chemspider.com/MassSpecAPI.asmx/GetExtendedCompoundInfoArray", CSIDs = c("23500", "23543"), token = token)
## End(Not run)



cleanEx()
nameEx("SOAPNameSpaces")
### * SOAPNameSpaces

flush(stderr()); flush(stdout())

### Name: SOAPNameSpaces
### Title: Get SOAP namespace definitions
### Aliases: SOAPNameSpaces
### Keywords: interface connection

### ** Examples

 SOAPNameSpaces()
 SOAPNameSpaces(omegahat="http://www.omegahat.org",
                 r = "http://www.r-project.org")

 SOAPNameSpaces(omegahat="http://www.omegahat.org",
                 r = "http://www.r-project.org", include="SOAP-ENV")

 SOAPNameSpaces(omegahat="http://www.omegahat.org",
                 r = "http://www.r-project.org", exclude="xsd")

 SOAPNameSpaces(omegahat="http://www.omegahat.org",
                 r = "http://www.r-project.org",
                 xsd = "my own XSD URI")



cleanEx()
nameEx("SOAPServer")
### * SOAPServer

flush(stderr()); flush(stdout())

### Name: SOAPServer
### Title: Create a SOAP server object
### Aliases: SOAPServer dynamicSOAPServer
### Keywords: interface connection

### ** Examples

server = SOAPServer("www.nanonull.com", "TimeService/TimeService.asmx")



cleanEx()
nameEx("SOAPServerDescription-class")
### * SOAPServerDescription-class

flush(stderr()); flush(stdout())

### Name: SOAPServerDescription-class
### Title: Description of a SOAP Server's methods and data types
### Aliases: SOAPServerDescription-class
### Keywords: classes

### ** Examples

  serverDesc = processWSDL(system.file("examples", "KEGG.wsdl", package = "SSOAP"))



cleanEx()
nameEx("genSOAPClientInterface")
### * genSOAPClientInterface

flush(stderr()); flush(stdout())

### Name: genSOAPClientInterface
### Title: Create R functions to access SOAP server methods
### Aliases: genSOAPClientInterface
### Keywords: interface programming

### ** Examples

 kegg = processWSDL("http://soap.genome.jp/KEGG.wsdl")
   # note that we force the use of the 1.1 name spaces to get arrays
   # handled correctly on the server side.
 iface = genSOAPClientInterface(def = kegg, nameSpaces = "1.1")

## Not run: 
##D     # This KEGG.wsdl is out of date
##D  tmp = processWSDL(system.file("examples", "KEGG.wsdl", package = "SSOAP"))
##D  iface = genSOAPClientInterface(tmp@operations[[1]], def = tmp, tmp@name, verbose=FALSE)
## End(Not run)

 setAs("Definition", "character",
         function(from) 
             structure(from@entry_id, names = from@definition))

 setAs("ArrayOfPathwayElement", "character", 
          function(from) sapply(from, as, "character"))

 o = iface@functions$list_organisms()

 as(o, "character")

 cat("See the file", system.file("examples", "KEGG.S", package = "SSOAP"), "for more examples\n")

     # Returns National Weather Service digital weather forecast data. 
  w = processWSDL("http://www.weather.gov/forecasts/xml/SOAP_server/ndfdXMLserver.php?wsdl")
  f = genSOAPClientInterface(,w)

    # For the next 5 days from now.
  str = f@functions$NDFDgenByDay(38.9936, -77.0224, Sys.time() +  60*24*60, 5, "m", "12 hourly")

  library(XML)
  xmlToList(xmlParse(str, asText = TRUE))

     # Note that the result is a string containing XML. The WSDL identifies the result
     # as an xsd:string and does not tell us about the structure of the contents.


     ##
     ## WABI
if(FALSE) {
     # This site was not available May 4th.
  w = processWSDL("http://xml.nig.ac.jp/wsdl/ARSA.wsdl")
  f = genSOAPClientInterface(,w )

  f@functions$searchSimple("Homo sapiens", 1, 100)
  x = f@functions$getENTRYbySPECIMEN("ATCC 43049", 1, 100)
  x = f@functions$getENTRYbyScientificName("Escherichia coli", 1, 400)
  els = readLines(textConnection(x))
     # get how many results are available in the database.
  totalCount = as.integer(substring(els[1], nchar("hitscount       = ")+1))
  hits = els[-1]  # the 400 results in the answer


  x = f@functions$searchByXMLPath("/ENTRY/DDBJ/accessions/accn='ab0001'", 
                                  "/ENTRY/DDBJ/primary-accession,/ENTRY/DDBJ/definition", 
                                  1, 100)
  els = unlist(strsplit(x, "\\n"))
  totalCount = as.integer(substring(els[1], nchar("hitscount       = ")+1))

  values = strsplit(els[-1], "\\t")
  ans = structure(sapply(values, `[`, 2), names = sapply(values, `[`, 1))

   ###
  w = processWSDL("WSDLs/MassSpecAPI.asmx?WSDL", port = 1)  
  f = genSOAPClientInterface(w)
     # SearchByMass2 expects an object of class SearchByMass2 which has
     # a mass and a range slot. But we can specify these separately, by
     # name or partial name, or as a list or as a SearchByMass2 object
  f@functions$SearchByMass2(89.0476, .01)
  f@functions$SearchByMass2(mass = 89.0476, range = .01)
  f@functions$SearchByMass2(range = .01, mass = 89.0476)

  f@functions$SearchByMass2(list(range = .01, mass = 89.0476))
  f@functions$SearchByMass2(new("SearchByMass2", range = .01, mass = 89.0476))
  
     ####
   # A HTTP GET interface
  w = processWSDL("WSDLs/MassSpecAPI.asmx?WSDL", port = 3)  
  f = genSOAPClientInterface(w)

  f@functions$GetDatabases()
  f@functions$SearchByMass2(89.0476, .01)
  f@functions$SearchByFormula("H2O")

## Not run: 
##D    # ned the token
##D   f@functions$GetExtendedCompoundInfoArray(c("23500", "23543"), token)
##D   f@functions$GetExtendedCompoundInfoArray(as.character(c(23500, 23543)), token)
## End(Not run)


  ##########
  w = processWSDL("WSDLs/MassSpecAPI.asmx?WSDL", port = "MassSpecAPIHttpPost")  
  f = genSOAPClientInterface(w)
  names(f@functions)
  db = f@functions$GetDatabases()
  f@functions$SearchByMass2(89.0476, .01)
## Not run: 
##D    # ned the token
##D   f@functions$GetExtendedCompoundInfoArray(c("23500", "23543"), token)
##D   f@functions$GetExtendedCompoundInfoArray(as.character(c(23500, 23543)), token)
## End(Not run)

}



cleanEx()
nameEx("processWSDL")
### * processWSDL

flush(stderr()); flush(stdout())

### Name: processWSDL
### Title: Read and process a Web Service Description Language file
### Aliases: processWSDL
### Keywords: interface connection

### ** Examples

  tmp = processWSDL(system.file("examples", "KEGG.wsdl", package = "SSOAP"))

   # The first set of operations, and the method "color_pathway_by_objects"
  o = tmp@operations[[1]][["color_pathway_by_objects"]]
  names(o@parameters)
  o@parameters[["fg_color_list"]]
  o@returnValue


  ff = genSOAPClientInterface(tmp@operations[[1]], def = tmp, tmp@name, verbose=FALSE)

# ff$functions$get_all_neighbors_by_gene(kid="eco:b0002", threshold= as.integer(500), orgs = c("ecs","ypk"))

## Not run: 
##D   x = ff@functions$get_paralogs_by_gene("eco:b0002", 1, 10)
## End(Not run)

  tp = get(".operation", environment(ff@functions$get_paralogs_by_gene))@returnValue


  # A different WSDL file.
  tmp = processWSDL(system.file("examples", "XMethodsFilesystemService.wsdl.xml", package = "SSOAP"))

## Not run: 
##D     cs = processWSDL("http://www.chemspider.com/MassSpecAPI.asmx?WSDL", port= 3)
##D     cs = processWSDL("http://www.chemspider.com/MassSpecAPI.asmx?WSDL", port = "MassSpecAPIHttpGet")
## End(Not run)



cleanEx()
nameEx("writeInterface")
### * writeInterface

flush(stderr()); flush(stdout())

### Name: writeInterface
### Title: Serialize generated interface to a file
### Aliases: writeInterface
### Keywords: programming IO

### ** Examples

w = processWSDL(system.file("examples", "KEGG.wsdl", package = "SSOAP"))
iface = genSOAPClientInterface(w)
f = tempfile()
writeInterface(iface, f)
source(f)
## Not run: 
##D db = list_databases()
##D class(db)
##D class(db[[1]])
## End(Not run)

u = "http://gmd.mpimp-golm.mpg.de/webservices/wsGoBioSpace.asmx?WSDL"
z = processWSDL(u, port = 1)
iface = genSOAPClientInterface(z)
f = tempfile()
writeInterface(iface, f)
source(f)

a = GetAdducts()
d = GetDepositors()

session = CreateSession(DepositorIds = c(3, 6, 8), AdductIds = c(2L, 3L))
sm = SearchMass12C(SessionID = session, mass = 579.1705, tolerance = 0.001)



### * <FOOTER>
###
cat("Time elapsed: ", proc.time() - get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
