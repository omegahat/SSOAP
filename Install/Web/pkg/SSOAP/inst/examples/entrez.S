z <- .SOAP("http://www.ncbi.nlm.nih.gov/entrez/eutils/soap/soap_adapter.cgi", method="run_eInfo", db="pubmed", action = I("einfo"))

z <- .SOAP("http://www.ncbi.nlm.nih.gov/entrez/eutils/soap/soap_adapter.cgi", method="run_eInfo", db="pubmed", action = I("einfo"), .convert =   function(xmlSource, header, method, server) {
        converters <- SOAPPrimitiveConverters
        converters[["xsd:DbName"]] <- function(x) as.character(x)
        converters[["xsd:Term"]] <- function(x) as.character(x)
        response <- xmlChildren(parseSOAP(xmlSource, asText=TRUE))
        names <- names(response)
        response <- lapply(response, fromSOAP, converters=converters)
        names(response) <- names
        response
  }
)


