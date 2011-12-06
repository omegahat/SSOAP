\name{parseSOAP}
\alias{parseSOAP}
\title{Parse XML message}
\description{
  This is a convenience function to parse the
  SOAP message returned from a server and retrieve
  the payload of the message as an XML tree in S.
}
\usage{
parseSOAP(xmlSource, header = FALSE, reduce = TRUE, ...,
          fullNamespaceInfo = TRUE)
}
\arguments{
  \item{xmlSource}{an string giving the name of an file or URL
    containing the XML content, or a string containing the XML content itself.}
  \item{header}{ignored}
  \item{reduce}{a logical value indicating whether to return
    the top-most XML node of the Body or to return
    the entire XML tree read from \code{xmlSource}.
    If this is true, we find the Body node and return its
    first child.}
  \item{\dots}{arguments that are passed directly to
    \code{\link[XML]{xmlTreeParse}} without being processed by this
    function.}
  \item{fullNamespaceInfo}{a logical value that is passed on to
    \code{\link[XML]{xmlTreeParse}} when parsing the SOAP response
      This controls how the namespace information on each XML node
      is represented, with \code{TRUE} causing the prefix and URI
      to be included rather than just the prefix.
  }
}
\value{
 An \code{XMLNode} object.
}
\references{
  \url{http://www.w3.org/TR/SOAP/}
  \url{http://www.omegahat.org/SSOAP},
  \url{http://www.omegahat.org/bugs}.
}
\author{Duncan Temple Lang <duncan@wald.ucdavis.edu>}
\seealso{
\code{\link[XMLSchema]{fromXML}}
}

\examples{

}
\keyword{interface}
\keyword{connection}
