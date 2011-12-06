\name{getReturnNode}
\alias{getReturnNode}
\title{Get XML node from SOAP response}
\description{
  Parse the XML content from the SOAP response
  and traverse the tree to find the node in the Body element
  associated with the result of the request.
  It looks for a node named
  This attempts to be helpful by taking input in 
  various forms, i.e. text of the body of the HTTP response,  
  header and body in a \code{SOAPHTTPReply} object returned form
  \code{\link{.SOAP}}, or the root node of a previously parsed XML tree.
}
\usage{
getReturnNode(node, name = "return")
}
\arguments{
  \item{node}{either an XML node that was obtained from parsing the text of the reply
              or the \code{SOAPHTTPReply} object returned from the \code{\link{.SOAP}} 
              call which contains the header and body of the HTTP request,
              or alternatively this can be the text content from the body of the HTTP response.
            }
   \item{name}{the name of the node in the SOAP response that
   is the container for the content of the response. This is often
   \code{"return"}  but can be any legal XML node name and is often
   given to us in a WSDL.
 }	    
}
\value{
 An \code{XMLNode} object.
}
\author{Duncan Temple Lang}
\seealso{
 \code{\link{.SOAP}}
 \code{\link[XML]{xmlTreeParse}}
}
\examples{

}
\keyword{IO}
\keyword{programming}
\concept{Web Services}
\concept{XML}
