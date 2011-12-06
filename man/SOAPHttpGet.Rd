\name{.SOAPHttpGet}
\alias{.SOAPHttpGet}
\alias{.SOAPHttpPost}
\title{Functions for making SOAP calls via HTTP GET or POST requests}
\description{
  These functions provide the basic functions for implementing
  a SOAP request via HTTP GET or POST bindings rather
  than the regular SOAP Envelope and Body bindings.
  These are often easier to use manually as they allow
  the caller to think of the request as a form or simple URL with named
  parameters.

  The functions can be used in generated code derived from processing a WSDL.
}
\usage{
.SOAPHttpGet(.url, ..., .params = list(...), .convert = TRUE, .opts = list())
.SOAPHttpPost(.url, ..., .params = list(...), .convert = TRUE, .opts = list(), .style = 'POST')
}
\arguments{
  \item{.url}{the full URL (as a string) identifying the SOAP method}
  \item{\dots}{a named list of parameters that are passed directly to  the HTTP request.}
  \item{.params}{this is a list of the parameters. This can be used by a
  caller who already has the inputs to the SOAP request in a list.}
\item{.convert}{a value that controls how the result is returned.
  If this is \code{FALSE}, the text of the HTTP request is returned
  directly. If this is \code{TRUE}, we use \code{fromXML} to convert the
  XML content to an R object.
  If \code{.convert} is an object derived from  the
  \code{GenericSchemaType} class that describes a data structure,
  then we use that data desciption to convert the XML to the
  corresponding R data type.
}
  \item{.opts}{a list of named options that are passed to \code{getForm}
    and \code{postForm} to control the RCurl request. See
     \code{listCurlOptions}.
   }
   \item{.style}{this is the \code{style} parameter of \code{postForm}
     and should be either "POST" or "HTTPPOST".}
}
\value{
  Either the text of the SOAP response or an R object converted from the
  XML content.
}

\author{
Duncan Temple Lang
}


\seealso{
\code{\link{.SOAP}}
}
\examples{

 .SOAPHttpGet("http://www.chemspider.com/MassSpecAPI.asmx/SearchByMass2", mass = 89.0476, range = 0.01)

\dontrun{
    # need token
  .SOAPHttpGet("http://www.chemspider.com/MassSpecAPI.asmx/GetExtendedCompoundInfoArray", CSIDs = c("23500", "23543"), token = token)
}
}

\keyword{programming}
\keyword{interface}

