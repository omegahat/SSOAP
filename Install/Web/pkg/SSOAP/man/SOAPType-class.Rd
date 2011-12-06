\name{SOAPType-class}
\docType{class}
\alias{SOAPType-class}
\alias{BasicSOAPType-class}
\alias{SOAPTypeReference-class}
\alias{SOAPVoidType-class}
\alias{VirtualSOAPClass-class}
\alias{VirtualXMLSchemaClass-class}

\title{Classes for representing types for SOAP values}
\description{
 These classes are for representing types from SOAP-related
 schema. They are used in describing SOAP methods read from
 a Web Service Description Language (WSDL) file.
}
\section{Objects from the Class}{
Objects can be created by calls of the form \code{new("SOAPType", ...)}.
More typically, however, these are created by reading a WSDL file
using \code{\link{processWSDL}}.
}
\section{Slots}{
  \describe{
    \item{\code{name}:}{Object of class \code{"character"}.  The name for the type of value being described.}
    \item{\code{ns}:}{Object of class \code{"character"}.  The shorthand for the XML namespace associated with this type.}
    \item{\code{nsuri}:}{Object of class \code{"character"}.  The URI/identifier that identifies the XML namespace associated with this type.}
  }
}
\section{Methods}{
  \describe{
    \item{toSOAP}{\code{signature(obj = "vector", con = "ANY", type = "SOAPType")}: convert an R object to its SOAP representation for the
         specified SOAP \code{type}. }
  }
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

}
\keyword{classes}
