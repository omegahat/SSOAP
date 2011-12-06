\name{writeTypes}
\alias{writeTypes}
\title{Output SOAP type information for an S object.}
\description{
  This is used in the \code{\link{toSOAP}} methods when writing
  an S object to a SOAP connection.
  It writes the SOAP attributes representing the SOAP type for the S object
  being serialized to the SOAP connection.
}
\usage{
writeTypes(x, con, types = getSOAPType(x))
}
\arguments{
  \item{x}{the S object being serialized to the SOAP connection}
  \item{con}{the S connection object to which to write the type
    information attributes}
  \item{types}{the type information attributes which are computed by
    calling \code{\link{getSOAPType}} by default.}
}
\value{
  The string giving the SOAP type attributes that are written to the
  connection.
}
\references{
  \url{http://www.w3.org/TR/SOAP/}
  \url{http://www.omegahat.org/SSOAP},
  \url{http://www.omegahat.org/bugs}.
}
\author{Duncan Temple Lang <duncan@wald.ucdavis.edu>}


\seealso{
 \code{\link{toSOAP}}
}
\examples{
}
\keyword{interface}
\keyword{connection}


