\name{SOAPTypes}
\alias{SOAPTypes}
\alias{SOAPPrimitiveConverters}
\alias{.SOAPDefaultNameSpaces}
\alias{.SOAPDefaultHandlers}
\non_function{}
\title{Data objects used in SSOAP}
\description{
  These are S objects that store default data
  for the SOAP functions.

  \code{SOAPTypes} is a list mapping
  the type of a primitive S object (typically computed via \code{\link{typeof}})
  to a SOAP type, typically given as a named character vector.
  The name-value pair gives an XML attribute name and value which
  identifies the SOAP type (e.g. \code{xsi:type = xsd:string}).

  \code{SOAPPrimitiveConverters} is a list of functions
  that handle mapping SOAP values to S primitive values.
  These are indexed by the different primitive SOAP type values,
  e.g. xsd:string, xsd:boolean, etc.

  \code{.SOAPDefaultNameSpaces} is a
  named list in which each element is a named-character vector giving
  the namespace identifier and URI
  (e.g. xsi="http://www.w3.org/2001/XMLSchema-instance")
  that are added to the top-most node of the XML message,
  i.e. in the \code{Envelope} node.
  The names of the list are used to index the different collections
  of namespaces, making \code{.SOAPDefaultNameSpaces} act
  like a catalog of SOAP specifications.

  \code{.SOAPDefaultHandlers} is a collection
  of named functions that are used to parameterize
  the way the \code{\link{.SOAP}} functions works.
  These functions are callbacks that can modify
  the way the HTTP request and SOAP message
  are constructed, and how the response is processed.
  
  The idea is that one can change these globally to customize
  the SSOAP package to local needs.
}
\usage{
SOAPTypes
SOAPPrimitiveConverters
SOAPNameSpaces
}

\source{
SSOAP package
}
\references{
  \url{http://www.w3.org/TR/SOAP/}
  \url{http://www.omegahat.org/SSOAP},
  \url{http://www.omegahat.org/bugs}.
}
\examples{
}
\keyword{datasets}
