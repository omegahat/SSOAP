\name{SOAPClientInterface-class}
\docType{class}
\alias{SOAPClientInterface-class}

\title{Representation of machine-generated interface to SOAP methods and classes}
\description{
 This is a simple class that combines a list of functions and a list
 of classes that are machine-generated to provide an R interface to a
 SOAP server.  It is just a mechanism for combining the code.
}
\section{Objects from the Class}{
We use the function \code{\link{genSOAPClientInterface}} to create instances
of this class.
Objects can be created by calls of the form \code{new("SOAPClientInterface", ...)}.
}
\section{Slots}{
  \describe{
    \item{\code{functions}:}{Object of class \code{"list"}. A list of the functions that are  proxies to the SOAP methods.}
    \item{\code{classes}:}{Object of class \code{"list"}. A list of classes defined in support of the functions.  These 
       correspond to the new data types defined by the SOAP server.}
  }
}
\section{Methods}{
No methods defined with class "SOAPClientInterface" in the signature.
}


\references{
  \url{http://www.w3.org/TR/SOAP/}
  \url{http://www.omegahat.org/SSOAP},
  \url{http://www.omegahat.org/bugs}.
}
\author{Duncan Temple Lang <duncan@wald.ucdavis.edu>}

\seealso{
\code{\link{genSOAPClientInterface}}
}
\examples{

}
\keyword{classes}
