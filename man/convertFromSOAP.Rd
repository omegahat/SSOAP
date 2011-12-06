\name{convertFromSOAP}
\alias{convertFromSOAP}
\alias{convertFromSOAP,SOAPResult-method}
\title{Convert SOAP result to S object}
\description{
 This generic function and its methods provide facilities for
 converting data from a SOAP XML structure to a \dQuote{value} object in R.
}
\usage{
convertFromSOAP(val, type, nodeName = "return", ...) 
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{val}{the XML object representing the data.}
  \item{type}{the target \dQuote{type} of object to which the XML should
    be converted.}
   \item{nodeName}{the name of the node in the SOAP response that
   is the container for the content of the response. This is often
   \code{"return"}  but can be any legal XML node name and is often
   given to us in a WSDL.
 }
 \item{\dots}{additional arguments for (future) methods}
}
\value{
 An R object of the type  identified by \code{type}.
}
\references{
  \url{http://www.w3.org/TR/SOAP/}
  \url{http://www.omegahat.org/SSOAP},
  \url{http://www.omegahat.org/bugs}.
}

\seealso{
 \code{\link{.SOAP}}
}
\examples{

}
\keyword{interface}
\keyword{connection}
