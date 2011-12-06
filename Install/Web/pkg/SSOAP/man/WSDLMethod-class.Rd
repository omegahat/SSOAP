\name{WSDLMethod-class}
\docType{class}
\alias{WSDLMethod-class}

\title{Description of a SOAP method}
\description{ 
This class is used to describe the elements of a SOAP method
as described in a Web Service Description Language (WSDL) file.
}
\section{Objects from the Class}{
Objects can be created by calls of the form \code{new("WSDLMethod", ...)}.
}
\section{Slots}{
  \describe{
    \item{\code{name}:}{Object of class \code{"character"}. The name of the method. }
    \item{\code{parameters}:}{Object of class \code{"list"}.  An ordered list of the parameter types for this method.}
    \item{\code{returnValue}:}{Object of class \code{"SOAPType"}. The
    type of the return value.}
    \item{\code{action}:}{Object of class \code{"SOAPAction"}.  The SOAP action value associated with this method.}
    \item{\code{namespace}:}{Object of class \code{"character"}.  The namespace associated with this method.}
    \item{\code{use}:}{a character vector with elements for input and
      output indicating whether the parts of the message are encoded
      using some encoding rules, or definte the schema.
      Each value is either \dQuote{literal} or \dQuote{encoded}. See
      \url{http://www.w3.org/TR/wsdl}, section 3.5.}
    \item{\code{documentation}:}{a string providing a human-readable
      (or more specifically arbitrary formed text) supposed to describe the method}
    \item{\code{bindingStyle}:}{the format/protocol of the XML messages sent to
      invoke and reply to a method, e.g. document and RPC are the  most
      common ones. But others are possible.}
    \item{\code{header}:}{a list.  This provides information about
      additional HTTP header information should be passed in the request
      for this operation. For example, this might be tickets/cookies
      that authorize the requestor to make the request.
    }
    \item{returnNodeName}{the name of the node in the SOAP response that
   is the container for the content of the response. This is often
   \code{"return"}  but can be any legal XML node name and is often
   given to us in a WSDL.}
  }
}
\section{Methods}{
No methods defined with class "WSDLMethod" in the signature.
}


\references{
  \url{http://www.w3.org/TR/SOAP/}
  \url{http://www.omegahat.org/SSOAP},
  \url{http://www.omegahat.org/bugs}.
}
\author{Duncan Temple Lang <duncan@wald.ucdavis.edu>}

\seealso{
 \code{\link{processWSDL}}
}
\examples{

}
\keyword{classes}
