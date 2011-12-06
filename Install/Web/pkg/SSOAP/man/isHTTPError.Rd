\name{isHTTPError}
\alias{isHTTPError}
\title{Determines if an error occurred in an HTTP communication}
\description{
  This examines the HTTP header information
  (computed via the \code{\link[RCurl]{curlPerform}} call that
   implements the HTTP communication with the SOAP server)
  and determines if there was an  error
  reported from the server.
}
\usage{
isHTTPError(response)
}
\arguments{
  \item{response}{the header information computed by collecting the
    header lines from the SOAP server's HTTP response.
    This is currently done via the call to
    \code{\link[RCurl]{curlPerform}} in the
    \code{\link{.SOAP}} function.
  }
}
\details{
  This just looks at the \code{status}
  entry and compares it to
  the value 200.

  The \code{\link[RCurl]{curlPerform}} is capable
  of performing redirections, etc. to handle
  manageable errors. See the options for that function.
}
\value{
  A logical value indicating whether
  there was an error (\code{TRUE})  or not (\code{FALSE}).
}
\references{
  \url{http://www.w3.org/TR/SOAP/}
  \url{http://www.omegahat.org/SSOAP},
  \url{http://www.omegahat.org/bugs}.
}
\author{Duncan Temple Lang <duncan@wald.ucdavis.edu>}


\seealso{
  \code{\link{.SOAP}}
  \code{\link[RCurl]{curlPerform}}
}

\examples{

}
\keyword{interface}
\keyword{connection}
