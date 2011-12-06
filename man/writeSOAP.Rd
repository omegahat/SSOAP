\name{writeSOAPBody}
\alias{writeSOAPBody}
\alias{writeSOAPEnvelope}
\alias{writeSOAPMessage}
%\alias{writeSOAPHeader}
\alias{writeSOAPBody,ANY,ANY,XMLInternalDocument-method}
\alias{writeSOAPBody,ANY,ANY,connection-method}
\alias{writeSOAPEnvelope,XMLInternalDocument-method}
\alias{writeSOAPEnvelope,connection-method}
\title{Write SOAP message elements directly to connection}
\description{
  These functions write the different parts of the
  SOAP request directly to an S connection.
  This means that they generate their content for the connection
  in order.
}
\usage{
writeSOAPBody(method, ..., xmlns = NULL, con, .types = NULL,
              .soapArgs = list(), .literal = FALSE,
              .header = NULL, .elementFormQualified = FALSE)
writeSOAPEnvelope(con, nameSpaces = SOAPNameSpaces())

writeSOAPMessage(con, nameSpaces, method, ..., .types = NULL,
                    xmlns = NULL, .soapArgs = list(), .literal = FALSE,
                     .soapHeader = NULL, .elementFormQualified = FALSE)
}
%writeSOAPHeader(url, host, action, con, ...)
\arguments{
  \item{method}{the name of the SOAP method to be invoked}
  \item{\dots}{For \code{writeSOAPBody} and \code{writeSOAPMessage},
    these are the name-value arguments for the SOAP method being called.
%    For \code{writeSOAPHeader}, these is a collection of
%    name-value strings that are added to the HTTP header.
   }
  \item{.soapArgs}{an alternative mechanism for passing arguments to the
  .SOAP call. This is a \code{list} of named or unnamed values which is
  used as the arguments for the SOAP method invocation.
  }  
  \item{xmlns}{the namespace given either as a simple string
    or as a named character vector of namespace URIs and local names.
    (Currently only one namespace is used). This is used for the
    top-level element of the node within the SOAP Body, corresponding
    to the actual request.}
  \item{con}{the connection object on which to write the
    HTTP and SOAP content}
  \item{.types}{a list parallelling the arguments to the SOAP method
    (i.e. \dots or \code{.soapArgs}) that specify the expected/required type
    of the individual arguments.  This information is typically
    constructed from the WSDL (Web Services Description Language)
     if that is available.  Otherwise, this can be an empty list in which case no
    constraints are placed on the arguments and the values are used
    as-is.  }
  \item{nameSpaces}{a named character vector giving the
   namespace identifier and URI pairs. These are added as attributes in
   the SOAP \code{Body} element of the generated XML.}
 \item{.literal}{a logical value indicating whether to use the literal
   format of the encoding for the seralization of objects.}
 \item{.header}{a character string (or \code{NULL} that is
   written as part of the SOAP header (not the HTTP header),
   before any other output, i.e. before the \code{<SOAP-ENV:Body>} is
   emitted.
   This is passed as the first argument to \code{writeSOAPHeader}.
 }
 \item{.soapHeader}{a string, an XML node or a function
   that can be optionally specified to add content to the SOAP
   message as the header of the envelope. 
   This is used in some Web services to provide transaction information
   such as a authentication and security details.
   See the eBaySvc.wsdl for an example.
   If this is a function, it is called with the value of \code{con}
   as the only argument. One might use a closure to include the 
   "private" and auxiliary information.
 }
\item{.elementFormQualified}{a logical value. If this is \code{FALSE},
   only the XML element identifying the method  call in the Body of the
   SOAP request uses the target namespace. The XML nodes representing
   the arguments in the method call do not use this namespace but are
   global. Alternatively, if this is \code{TRUE}, the target namespace
   of the schema is defined as the default name space on the XML element
   for the method call and so is inherited by the elements for the parameters.
 } 
 % Old
%  \item{url}{the name of the file within the host, without the leading `/'}
%  \item{host}{the name of the host for the SOAP server, e.g. \code{www.omegahat.org}}
%  \item{action}{the string to add to the HTTP header for the SOAPAction.} 
}

\value{
  For each function, the return value
  is irrelevant. It is the side-effect of writing
  to the connection that is used for.
}
\references{
  \url{http://www.w3.org/TR/SOAP/}
  \url{http://www.omegahat.org/SSOAP},
  \url{http://www.omegahat.org/bugs}.
}
\author{Duncan Temple Lang <duncan@wald.ucdavis.edu>}
\note{
  A different approach is to create the XML ``payload''
  first as a string (by creating it as an XML tree
  and then serializing that to a buffer).
  This allows one to add the Content-Length to the HTTP
  header.
}

\seealso{
 \code{\link{.SOAP}}
}

\examples{

}
\keyword{interface}
\keyword{connection}

