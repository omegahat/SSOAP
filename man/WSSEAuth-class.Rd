\name{WSSEAuth-class}
\Rdversion{1.1}
\docType{class}
\alias{WSSEAuth-class}
\alias{coerce,WSSEAuth,XMLInternalElementNode-method}
\alias{coerce,WSSEAuth,XMLInternalNode-method}

\title{Class \code{"WSSEAuth"}}
\description{
  This is a class that is used to represent authentication
  information that is to be sent as part of the SOAP request.
  It is made up of a username and password. The object
  can then be converted to the appropriate XML.
}
\section{Objects from the Class}{
Objects can be created by calls of the form \code{new("WSSEAuth", ...)}.
}
\section{Slots}{
  \describe{
    \item{\code{username}:}{Object of class \code{"character"} the user
      name/login to identify the person making the request}
    \item{\code{password}:}{Object of class \code{"character"} the
      password for that user }
    \item{\code{required}:}{Object of class \code{"logical"} an optional
      value that indicates whether to add the mustUnderstand attribute
      in the request to ensure that the server raises an error if the
      authentication is not understood or fails.}
  }
}
\section{Methods}{
  \describe{
    \item{coerce}{\code{signature(from = "WSSEAuth", to = "XMLInternalElementNode")}: ... }
    \item{coerce}{\code{signature(from = "WSSEAuth", to = "XMLInternalNode")}: ... }
	 }
}
\references{
  \url{http://en.wikipedia.org/wiki/WS-Security}
  \url{http://msdn.microsoft.com/en-us/library/ms951257}.
}
\author{
Duncan Temple Lang
}


\seealso{
  \code{\link{.SOAP}}
}
\examples{
showClass("WSSEAuth")

auth = new("WSSEAuth", username = "duncan", password = "bob")
as(auth, "XMLInternalNode")

\dontrun{
  # This adds a Header to the request with user name and password
  # It is NOT needed for this service, but we are just using it as an
  # example of how we can pass the authentication information.
.SOAP("http://soap.genome.jp/keggapi/request_v6.2.cgi", "list_databases",
       action = "SOAP/KEGG#list_databases",
       .soapHeader = auth)
}
}
\keyword{classes}
