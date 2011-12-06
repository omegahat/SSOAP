\name{getSOAPType}
\alias{getSOAPType}
\title{Compute the SOAP type identifier for an S object}
\description{
  This determines the SOAP type for the given S object
  so that it can be used in an XML element.
  It returns a collection of name-value pairs
  (as a named character vector) which
  can be used as XML attributes forthe element defining the
  value.
}
\usage{
getSOAPType(obj, value = NULL)
}
\arguments{
  \item{obj}{the S object whose SOAP type information is to be determined}
  \item{value}{for arrays, this specifies the type of the elements of
    that array.}
}
\details{
  This consults \code{SOAPTypes} to find the types.
}
\value{
  A named character vector giving the
  XML attribute name and value pairs.
}
\references{
  \url{http://www.w3.org/TR/SOAP/}
  \url{http://www.omegahat.org/SSOAP},
  \url{http://www.omegahat.org/bugs}.
}
\author{Duncan Temple Lang <duncan@wald.ucdavis.edu>}

\seealso{
 \code{\link{writeSOAPMessage}}
}

\examples{

}
\keyword{interface}
\keyword{connection}
