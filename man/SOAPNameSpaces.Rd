\name{SOAPNameSpaces}
\alias{SOAPNameSpaces}
\title{Get SOAP namespace definitions}
\description{
  This is a convenience function that makes it
  easy to in-line the specification of the top-level
  or global SOAP namespaces within a \code{\link{.SOAP}}
  call.
  It provides a way to cumulate namespace
  identifiers and URIs into a named vector
  by specifying the relevant collection within the
  ``catalog'' of SOAP-namespace collections
  and to augment that collection, override elements
  and/or include and exclude certain elements by name.
}
\usage{
SOAPNameSpaces(..., include = character(0), exclude = character(0),
                version = getOption("SSOAP:DefaultNamespace"))
}
\arguments{
  \item{\dots}{an arbitrary number of id-URI pairs that define
    a namespace. These are included in the collection returned from this
    function
    along with any values identified via the \code{version} argument
    in the \code{.SOAPDefaultNameSpaces} list.}
  \item{include}{a character vector giving the names of the elements
    to include. This is used to identify (a few) elements
    that are to be kept from the defaults identified by \code{version}.}
  \item{exclude}{a character vector giving the names of the elements
    to discard. This is usually deployed when we want to keep a large
    number of elements and it is more convenient to explicitly exclude some.}
  \item{version}{a name that identifies an element in the
    \code{.SOAPDefaultNameSpaces} list that is used to
    get the default values.
    If this does not match a name in that list, no defaults
    are used and only the values in \code{\dots} are
    used.
   }
}
\value{
  A named vector giving the id-URI pairs of namespaces.
}
\references{
  \url{http://www.w3.org/TR/SOAP/}
  \url{http://www.omegahat.org/SSOAP},
  \url{http://www.omegahat.org/bugs}.
}
\author{Duncan Temple Lang <duncan@wald.ucdavis.edu>}

\seealso{
 \code{.merge}
}

\examples{
 SOAPNameSpaces()
 SOAPNameSpaces(omegahat="http://www.omegahat.org",
                 r = "http://www.r-project.org")

 SOAPNameSpaces(omegahat="http://www.omegahat.org",
                 r = "http://www.r-project.org", include="SOAP-ENV")

 SOAPNameSpaces(omegahat="http://www.omegahat.org",
                 r = "http://www.r-project.org", exclude="xsd")

 SOAPNameSpaces(omegahat="http://www.omegahat.org",
                 r = "http://www.r-project.org",
                 xsd = "my own XSD URI")
}
\keyword{interface}
\keyword{connection}
