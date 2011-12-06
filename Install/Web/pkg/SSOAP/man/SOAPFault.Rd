\name{SOAPFault}
\alias{SOAPFault}
\title{Create a SOAP Fault object}
\description{
  This creates an object representing
  a SOAP fault object returned from a
  a SOAP server.
  It creates an S4 object of the appropriate
  class, either one of the built-in SOAP fault
  classes or a general SOAP fault object.
}
\usage{
SOAPFault(node)
}
%- maybe also `usage' for other objects documented here.
\arguments{
  \item{node}{the top-level XML node from the SOAP response
  giving the fault information}
}

\value{
  An object derived from \code{SOAPFault}.
  Can be one of
  \code{SOAPVersionMismatchFault},
  \code{SOAPMustUnderstandFault},
  \code{SOAPClientFault} or
  \code{SOAPGeneralFault}.
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
\keyword{interface}
\keyword{connection}
