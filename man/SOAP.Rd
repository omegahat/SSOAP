\name{.SOAP}
\alias{.SOAP}
\title{Invoke a SOAP method}
\description{
  This is used to call a SOAP method
  in a SOAP server, passing the relevant arguments
  from S and converting the response into an S object.
  The communication between S and the SOAP server is
  handled via connections.
}
\usage{
.SOAP(server, method, ..., .soapArgs = list(), action, nameSpaces = SOAPNameSpaces(),
      xmlns = NULL, handlers = SOAPHandlers(), .types = NULL,
      .convert = TRUE, .opts = list(), curlHandle = getCurlHandle(),
      .header = getSOAPRequestHeader(action, .server = server),
      .literal = FALSE, .soapHeader = NULL, .elementFormQualified = FALSE,
      .returnNodeName = NA)
}
\arguments{
  \item{server}{a \code{SOAPServer} object}
  \item{method}{the name of the SOAP method to invoke}
  \item{\dots}{name=value arguments to pass to the }
  \item{.soapArgs}{an alternative mechanism for passing arguments to the
  .SOAP call. This is a \code{list} of named or unnamed values which is
  used as the arguments for the SOAP method invocation.
  }
  \item{action}{the SOAPAction string to put in the HTTP header. This is
    required.  If it is an object of class \code{AsIs}, it is left exactly as
    it is.  This allows one to call this function as
    .SOAP(...., action = I("einfo")) without having to
    provide a handler to bypass the default action
    mechanism.}
  \item{nameSpaces}{a named character vector giving the
    XML namespaces to add to the Body. These are given
    as a named character vector with the names giving the
    local namespace identifier and the value being the
    URI corresponding to that namespace identifier.
    For ease of use, one can identify the collections
    corresponding to the 1999 or 2001 schema using
    the simpler strings "1.1" and "1.2" respectively.
    If \code{nameSpaces} is a single string, we use it
    to index the element in the \code{.SOAPDefaultNameSpaces} list.
   }
  \item{xmlns}{the name space to use for the XML nodes
    which specify the actual method call, i.e. within the BODY.
    This is either a single string, or a name-value pair
    given as a character vector. The name is the namespace identifier
    and the value is the URI.}
  \item{handlers}{a collection of functions that, if present, are called
    at different points in the SOAP invocation to
    process the input and output.
    These can be thought of as event callbacks and include
    \code{action} for creating the final form of the SOAPAction string,
    \code{converter} for processing the XML returned by the SOAP server
    in the case of a successful invocation, and so on.
  }
  \item{.types}{[not yet implemented] allows one to explicitly control
    the conversion of the arguments to the appropriate/desired
    SOAP type. This is useful when you know what the server is expecting.
  }
  \item{.convert}{a function, a logical value or a \code{SOAPType}.
     If this is a function, it should take two arguments: the content to
     be converted from SOAP format to R and the target type described as
     a SOAPType object. This should return an R object representing the
     SOAP content. If, alternativley, this is supplied as a logical
     value, this controls whether the default converters are used
     (\code{TRUE}) or not
     (\code{FALSE}). These converters are taken from the \code{handlers}
     argument.
     And finally, if \code{.convert} is a \code{SOAPType} object,
     we call \code{convertFromSOAP} with the
     
   }
  \item{.opts}{a named list of elements that are passed to the
  \link[RCurl]{curlPerform} function which actually invokes the SOAP
  method. These options control aspects of the HTTP request, including
  debugging information that is displayed on the console, e.g.
  \code{.opts = list(verbose = TRUE)}}
 \item{curlHandle}{this is passed to \code{\link[RCurl]{curlPerform}} as
   the \code{curlHandle} argument. By providing this as a parameter
   here, the user can reuse an existing curl handle with
   options explicitly set just once. Additionally,
   one can control the connection to the Web server
   using keep-alive connections, etc. to improve performance.
 }
 \item{.header}{a named character vector of elements which are used in
   the HTTP header for the SOAP request.
   These are calculated by default within the .SOAP call,
   but the parameter allows them to be pre-computed
   and supplied in the call.
 }
 \item{.literal}{a logical value indicating whether to use the literal
   encoding for serializing the data being sent to and from the server.}
 \item{.soapHeader}{
   this allows the caller to specify the SOAP content for
   the Header part of the SOAP request.
   This is sometimes used to supply information such
   as login and password or other forms of authentication and
   authorization.
   The value for this parameter can be the text of the XML
   header node, an XML node itself, or alternatively a function
   that returns such a node (or text with the XML content).
   The function is called with the SOAP document being created
   and the name of the SOAP method.
 }
%  \item{.debug}{a logical value indicating whether we
%    want to simply look at the content that would be sent
%    to the HTTP/SOAP server. }

\item{.elementFormQualified}{a logical value. If this is \code{FALSE},
   only the XML element identifying the method  call in the Body of the
   SOAP request uses the target namespace. The XML nodes representing
   the arguments in the method call do not use this namespace but are
   global. Alternatively, if this is \code{TRUE}, the target namespace
   of the schema is defined as the default name space on the XML element
   for the method call and so is inherited by the elements for the parameters.
 }
 \item{.returnNodeName}{the name of the node in the SOAP response that
   is the container for the content of the response. This is often
   \code{"return"}  but can be any legal XML node name and is often
   given to us in a WSDL.
 }
}
\value{
 An S object representing the return value from the SOAP method invocation.
}
\references{
  \url{http://www.w3.org/TR/SOAP/}
  \url{http://www.omegahat.org/SSOAP},
  \url{http://www.omegahat.org/bugs}.
}
\author{Duncan Temple Lang <duncan@wald.ucdavis.edu>}
\seealso{
  \code{\link{writeSOAPMessage}}
  \code{\link{isHTTPError}}
  \code{\link[RCurl]{curlPerform}}
  \code{\link[RCurl]{postForm}}  
}

\examples{
\dontrun{
.SOAP(SOAPServer("services.xmethods.net", "soap"),
       "getRate", country1="England", country2 = "Japan",
       action="urn:xmethods-CurrencyExchange")

.SOAP(SOAPServer("services.xmethods.net", "soap/servlet/rpcrouter"),
      "getPrice", "0596000278",
      action="urn:xmethods-BNPriceCheck")

s <- SOAPServer("http://services.xmethods.net/soap")
.SOAP(s,
      "getQuote", "AMZN",
      action="urn:xmethods-delayed-quotes#getQuote")


.SOAP(SOAPServer("services.soaplite.com", "temper.cgi"),
       "c2f", 37.5,
      action="http://www.soaplite.com/Temperatures")


 # Different action and namespace.
 # Specify handlers=NULL to avoid the additional processing of the
 # SOAPAction string, i.e. the appending of the method name.
 # This kills off all the handlers. If we want to remove only the
 # "action" element, we have to be more explicit.

s1 <- SOAPServer("services.soaplite.com", "interop.cgi")
.SOAP(s1,
      "echoString", "From R",
      action="urn:soapinterop",
      xmlns=c(namesp1="http://soapinterop.org/"),
      handlers =NULL)
}


\dontrun{
  # This adds a Header to the request with user name and password
  # It is NOT needed for this service, but we are just using it as an
  # example of how we can pass the authentication information.
.SOAP("http://soap.genome.jp/keggapi/request_v6.2.cgi", "list_databases",
       action = "SOAP/KEGG#list_databases",
       .soapHeader = auth)
}

}
\keyword{interface}
\keyword{connection}
