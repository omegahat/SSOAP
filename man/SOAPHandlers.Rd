\name{SOAPHandlers}
\alias{SOAPHandlers}
\title{Get SOAP function handlers}
\description{
  This returns a collection of functions that
  are used by the \code{\link{.SOAP}}
  function to control exactly how the
  HTTP request and SOAP message is created
  and how the result is processed.
  Values are merged with the values from
  \code{.SOAPDefaultNameSpaces}.
  
  This is a convenient mechanism for specifying
  the collection of functions to use to parameterize
  the different aspects of the SOAP mechanism in S.

}
\usage{
SOAPHandlers(..., include = character(0), exclude = character(0))
}
\arguments{
  \item{\dots}{name=function pairs giving values to be returned in the
    list of functions. These override corresponding elements in
    \code{.SOAPDefaultNameSpaces}.}
  \item{include}{a character vector giving the names of the elements
    to include. This is used to identify (a few) elements
    that are to be kept from the defaults identified by \code{version}.}
  \item{exclude}{a character vector giving the names of the elements
    to discard. This is usually deployed when we want to keep a large
    number of elements and it is more convenient to explicitly exclude some.}  
}
\value{
  A named list of functions.
  The names correspond to the different elements
  that are accessed by the \code{\link{.SOAP}}
  function.
  Currently, these are
  \item{action}{convert the user-specified SOAPAction to
    the target one. By default, this appends \code{#methodName} to the
    user's value.
    This takes four  arguments:
    the user's action, the name of the method, the SOAP server object
    and the vector of request-specific namespaces (i.e. the \code{xmlns}
    argument for \code{\link{.SOAP}}.}
}
\references{
  \url{http://www.w3.org/TR/SOAP/}
  \url{http://www.omegahat.org/SSOAP},
}
\author{Duncan Temple Lang <duncan@wald.ucdavis.edu>}
\seealso{
  \code{\link{SOAPNameSpaces}}
  \code{.merge}
}


\examples{
 SOAPHandlers()
 SOAPHandlers(action = function(action, method, server, xmlns) action)

 SOAPHandlers(exclude="action")
}
\keyword{interface}
\keyword{connection}
