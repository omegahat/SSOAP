\name{processWSDL}
\alias{processWSDL}
\title{Read and process a Web Service Description Language file}
\description{
  This reads and converts a WSDL file for a server
  into a collection of functions and methods.
}
\usage{
processWSDL(fileName = "KEGG.wsdl", handlers =
             WSDLParseHandlers(fileName), nameSpaces = character(),
             useInternalNodes = TRUE, verbose = FALSE, port = 1L,
             checkCircularTypes = TRUE)
}
\arguments{
  \item{fileName}{the name of the WSDL file or URI.}
  \item{handlers}{a list of handler functions that are passed to
    \code{\link[XML]{xmlTreeParse}} to perform transformations on the XML
      nodes as the are parsed and converted to R objects.
      The default handlers drop comments and take care of importing
      files that are referenced via <wsdl:import> nodes.}
    \item{nameSpaces}{a character vector that identifies the
      namespace-URI mappings used for calls to this server.
      This maps the namespace abbreviations to the actual URIs.
      This can be a named character vector of these mappings, or
      alternatively a simple character string that identifies the name of
      the element in the \code{.SOAPDefaultNameSpaces} list.
      And if we don't know the collection of namespaces, we use
      \code{NA} to indicate that we shall determine this later.}
    \item{useInternalNodes}{a logical value indicating whether to use
         internal/C-level nodes for the XML tree or to use R objects
         representing the nodes.
     }
    \item{verbose}{a logical value indicating whether to emit messages to the console
      signalling progress being made and what elements are being processed.
      This is passed to \code{\link[XMLSchema]{processSchemaTypes}}.
    }
    \item{port}{a number or string that is used to identify which of the
      \code{port} elements to use in the WSDL. This allows the caller
      to specify whether they want to use, e.g., SOAP 1.1 or SOAP 1.2
      or SOAP PUT if the WSDL provides more than one of these}
  \item{checkCircularTypes}{a logical value that controls whether we
    check for circular references in definitions of data types in the
    XML schema.}
}


\value{
   An object of class \code{\link{SOAPServerDescription}}.
}

\author{Duncan Temple Lang <duncan@wald.ucdavis.edu>}
\seealso{
  \code{UseDashInSOAPNames} is an R option that can be set by the
  user that is understood by this package to control
  whether to either leave SOAP method names as-is,
  or if \code{FALSE}, to remove \code{_} in the
  names and capitalize the first character in all but
  the first word of the name. In other words, if
  \code{UseDashInSOAPNames} is set to FALSE,
  the name \code{abc_def_ghi} is mapped to
  \code{abcDefGhi}.  By default,
  the value is unset and
  treated as \code{TRUE}, so dashes are preserved.
}

\examples{
  tmp = processWSDL(system.file("examples", "KEGG.wsdl", package = "SSOAP"))

   # The first set of operations, and the method "color_pathway_by_objects"
  o = tmp@operations[[1]][["color_pathway_by_objects"]]
  names(o@parameters)
  o@parameters[["fg_color_list"]]
  o@returnValue


  ff = genSOAPClientInterface(tmp@operations[[1]], def = tmp, tmp@name, verbose=FALSE)

# ff$functions$get_all_neighbors_by_gene(kid="eco:b0002", threshold= as.integer(500), orgs = c("ecs","ypk"))

\dontrun{
  x = ff@functions$get_paralogs_by_gene("eco:b0002", 1, 10)
}

  tp = get(".operation", environment(ff@functions$get_paralogs_by_gene))@returnValue


  # A different WSDL file.
  tmp = processWSDL(system.file("examples", "XMethodsFilesystemService.wsdl.xml", package = "SSOAP"))

\dontrun{
    cs = processWSDL("http://www.chemspider.com/MassSpecAPI.asmx?WSDL", port= 3)
    cs = processWSDL("http://www.chemspider.com/MassSpecAPI.asmx?WSDL", port = "MassSpecAPIHttpGet")
}
}
\keyword{interface}
\keyword{connection}


