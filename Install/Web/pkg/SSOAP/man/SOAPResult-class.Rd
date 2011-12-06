\name{SOAPResult-class}
\docType{class}
\alias{SOAPResult-class}

\title{Description of a the result of a SOAP request}
\description{
This class is used to provide access to the result of the
SOAP request over HTTP.  It separates the result
into the header and body/content returned by the HTTP
server.
}
\section{Objects from the Class}{
This is not typically used except within code in the SSOAP package
when it is returned from a call to \code{\link{.SOAP}}.
Objects can be created by calls of the form \code{new("SOAPResult", ...)}.
}
\section{Slots}{
  \describe{
    \item{\code{header}:}{Object of class \code{"list"}. A named list of values from the header of the 
         HTTP  communication returned by the SOAP server in response to a SOAP request.}
    \item{\code{content}:}{Object of class \code{"character"}.  The body or content of the HTTP request. 
       The header field provides information about how to interpret the content in this field,
      e.g. the style of encoding.}
  }
}
\section{Methods}{
  \describe{
    \item{convertFromSOAP}{\code{signature(val = "SOAPResult")}: converts the value in the content slot to an R object, 
         using the fields in the header slot to interpret the content appropriately.}
  }
}
\references{
  \url{http://www.w3.org/TR/SOAP/}
  \url{http://www.omegahat.org/SSOAP},
  \url{http://www.omegahat.org/bugs}.
}
\author{Duncan Temple Lang <duncan@wald.ucdavis.edu>}

\seealso{
 \code{\link{.SOAP}}
}
\examples{

}
\keyword{classes}
