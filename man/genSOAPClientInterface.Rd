\name{genSOAPClientInterface}
\alias{genSOAPClientInterface}
\title{Create R functions to access SOAP server methods}
\description{
  This function creates function definitions, etc. that provide
  access to the methods described in the SOAP server description
  details.  
}
\usage{
genSOAPClientInterface(operations = def@operations[[1]], def, name = def@name,
                       env = new.env(parent = globalenv()), where = globalenv(),
                       server = def@server, nameSpaces = def@nameSpaces, 
                       addSoapHeader = FALSE, verbose = FALSE, force = FALSE,
                       putFunctions = FALSE,  verb = def@verb,
                       opFun = getOperationFunction(verb), opts = new("CodeGenOpts"), ...)
}
\arguments{
  \item{operations}{a list of the descriptions of the server's methods. Each method description 
     provides information about the parameters and the return value.}
  \item{def}{the \code{\link{SOAPServerDescription-class}} object.}
  \item{name}{currently unused }
  \item{env}{an environment object.  This is used ?}
  \item{where}{the location (usually in the search path) where new S4 classes will 
    be defined to represent the complex return types.  This can be any value that is acceptable for the
    \code{where} argument of \code{\link[methods]{setClass}}, i.e. 
     an integer, a package name (\dQuote{package:name}) or, explicitly, an environment.  }
   \item{server}{an object which will be used as the server in the SOAP
     calls. This provides the user with a mechanism to provide an
     alternative server object such as one which contains a password
     or which already has a connection to the SOAP server, or controls
     the connection in different ways.
   }
   \item{nameSpaces}{a character vector that identifies the
      namespace-URI mappings used for calls to this server.
      This maps the namespace abbreviations to the actual URIs.
      This can be a named character vector of these mappings, or
      alternatively a simple character string that identifies the name of
      the element in the \code{.SOAPDefaultNameSpaces} list.
      And if we don't know the collection of namespaces, we use
      \code{NA} to indicate that we shall determine this later.}
    \item{addSoapHeader}{ controls whether a \code{.soapHeader}
      parameter is added to each function that is generated for the SOAP
      server.
      If this is a logical, \code{TRUE} indicates to add the
      \code{.soapHeader} parameter; \code{FALSE} indicates it is omitted.
      If this is not a logical value, it is taken as the value to be
      supplied as the default value for the \code{.soapHeader}
      parameter in each generated function.
    }
 \item{verbose}{a logical indicating whether information about the processing should be displayed on the console,
   as it occurs.}
 \item{force}{a logical value that controls how we handle the case where
   we would define an S4 class corresponding to a data type in the
   schema but for which there already exists a class of that name
   (within the  environment in which we are defining the schema-related
   classes).
   \code{TRUE} means that we will overwrite the existing class
   definition;
   \code{FALSE} means to leave the existing class definition.
   This is useful when we run the interface generation code a second
   time and so have existing class defintions from the first run.
 }
 \item{putFunctions}{either a logical value or an environment or
   something that can be passed as the third argument to
   \code{\link[base]{assign}}.
   This controls whether we assign the individual functions as variables
   in \code{where} or another environment.
 }
 \item{opts}{an instance of the class \code{CodeGenOpts} or a derived
   sub-class that is used to specify the parameters that control the
   sub-functions that generate the code.
   At present, this is limited to the \code{makePrototype}
   slot that controls whether we map string elements to empty \code{""}
   strings rather than zero-length character vectors.  Whether this is a
   good choice depends on the Web service/interface and if it's WSDL
   deals with optional values properly.
 }
 \item{verb}{a string identifying the type of binding/transport for the
   requests. This can be "GET", "POST" or \code{NA} which is the default
   and refers to the regular SOAP messaging.
 }
 \item{opFun}{the function for creating the R function for each
   operation. This depends on \code{verb} to generate different
   functions for different transportation mechanisms.
 }
 \item{\dots}{additional arguments passed to \code{processSchemaTypes}}
}
\value{
  An object of class \code{SOAPClientInterface}
  containing both functions and class definitions. 
}

\references{
  \url{http://www.w3.org/TR/SOAP/}
  \url{http://www.omegahat.org/SSOAP},
  \url{http://www.omegahat.org/bugs}.
}
\author{Duncan Temple Lang <duncan@wald.ucdavis.edu>}


\seealso{
 \code{\link{processWSDL}}
 }
\examples{
 kegg = processWSDL("http://soap.genome.jp/KEGG.wsdl")
   # note that we force the use of the 1.1 name spaces to get arrays
   # handled correctly on the server side.
 iface = genSOAPClientInterface(def = kegg, nameSpaces = "1.1")

\dontrun{
    # This KEGG.wsdl is out of date
 tmp = processWSDL(system.file("examples", "KEGG.wsdl", package = "SSOAP"))
 iface = genSOAPClientInterface(tmp@operations[[1]], def = tmp, tmp@name, verbose=FALSE)
}

 setAs("Definition", "character",
         function(from) 
             structure(from@entry_id, names = from@definition))

 setAs("ArrayOfPathwayElement", "character", 
          function(from) sapply(from, as, "character"))

 o = iface@functions$list_organisms()

 as(o, "character")

 cat("See the file", system.file("examples", "KEGG.S", package = "SSOAP"), "for more examples\n")

     # Returns National Weather Service digital weather forecast data.
  library(RCurl)
  if(url.exists("http://www.weather.gov/forecasts/xml/SOAP_server/ndfdXMLserver.php?wsdl")) {
     w = processWSDL("http://www.weather.gov/forecasts/xml/SOAP_server/ndfdXMLserver.php?wsdl")
     f = genSOAPClientInterface(,w)

         # For the next 5 days from now.
     str = f@functions$NDFDgenByDay(38.9936, -77.0224, Sys.time() +  60*24*60, 5, "m", "12 hourly")

     library(XML)
     xmlToList(xmlParse(str, asText = TRUE))
  }
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
  els = unlist(strsplit(x, "\\\n"))
  totalCount = as.integer(substring(els[1], nchar("hitscount       = ")+1))

  values = strsplit(els[-1], "\\\t")
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

\dontrun{
   # ned the token
  f@functions$GetExtendedCompoundInfoArray(c("23500", "23543"), token)
  f@functions$GetExtendedCompoundInfoArray(as.character(c(23500, 23543)), token)
}


  ##########
  w = processWSDL("WSDLs/MassSpecAPI.asmx?WSDL", port = "MassSpecAPIHttpPost")  
  f = genSOAPClientInterface(w)
  names(f@functions)
  db = f@functions$GetDatabases()
  f@functions$SearchByMass2(89.0476, .01)
\dontrun{
   # ned the token
  f@functions$GetExtendedCompoundInfoArray(c("23500", "23543"), token)
  f@functions$GetExtendedCompoundInfoArray(as.character(c(23500, 23543)), token)
}

}
}
\keyword{interface}
\keyword{programming}
