\name{SOAPResult}
\alias{SOAPResult}
\title{Create an object to represent the raw result of a SOAP invocation}
\description{
  This function creates an object of class \code{SOAPResult}
  which is used to represent both the header
  and the body of the HTTP response from a SOAP invocation.
  Such an object is created in the \code{\link{.SOAP}}
  function and used to convert the body into an S value.
}
\usage{
SOAPResult(content, header, obj = new("SOAPResult"))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{content}{a character vector representing the body of the HTTP response.}
  \item{header}{a named list of name-value pairs giving the details of
    the header of the HTTP response.}
  \item{obj}{an instance of the class that we are creating, derived from
   \code{SOAPResult}.}
}
\value{
  An object of class \code{SOAPResult}.
  \item{content}{Description of 'comp1'}
  \item{header}{Description of 'comp2'}
  ...
}
\references{
  \url{http://www.w3.org/TR/SOAP/}
  \url{http://www.omegahat.org/SSOAP}
}
\author{Duncan Temple Lang <duncan@wald.ucdavis.edu>}


\seealso{
  \code{\link{.SOAP}}
  \code{\link[XMLSchema]{fromXML}}
   \code{\link{isHTTPError}}
}
\examples{

}
\keyword{interface}


