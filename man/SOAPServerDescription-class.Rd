\name{SOAPServerDescription-class}
\docType{class}
\alias{SOAPServerDescription-class}

\title{Description of a SOAP Server's methods and data types}
\description{
 This represents a complete description of the methods and associated
 data types for inputs and outputs of a SOAP server.
}
\section{Objects from the Class}{
Objects can be created by calls of the form \code{new("SOAPServerDescription", ...)}.
More typically, however, one will use \code{\link{processWSDL}} to create
such an object.

}
\section{Slots}{
  \describe{
    \item{\code{name}:}{Object of class \code{"character"}. The name of the server.}
    \item{\code{server}:}{Object of class \code{"SOAPServer"}.  The details of how to identify or connect to the server object.}
    \item{\code{operations}:}{Object of class \code{"list"}. A list of the sets of operations/methods. A server may have 
       more than one collection of methods. This list is the top-level container and each element
       is itself a list containing \code{WSDLMethod} objects.}
    \item{\code{types}:}{Object of class \code{"list"}.  The named collection of data types defined within the WSDL for the server.}
    \item{\code{nameSpaces}:}{a character vector that identifies the
      namespace-URI mappings used for calls to this server.
      This maps the namespace abbreviations to the actual URIs.
      This can be a named character vector of these mappings, or
      alternatively a simple character string that identifies the name of
      the element in the \code{.SOAPDefaultNameSpaces} list.
      And if we don't know the collection of namespaces, we use
      \code{NA} to indicate that we shall determine this later.
    }
    \item{\code{verb}:}{a character string identifying the type of the
      binding, i.e. GET, POST or \code{NA}.}
  }
}
\section{Methods}{
No methods defined with class "SOAPServerDescription" in the signature.
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
  serverDesc = processWSDL(system.file("examples", "KEGG.wsdl", package = "SSOAP"))
}
\keyword{classes}
