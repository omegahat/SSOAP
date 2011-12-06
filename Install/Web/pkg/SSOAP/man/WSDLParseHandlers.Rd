\name{WSDLParseHandlers}
\alias{WSDLParseHandlers}
\title{Creates functions for XML parser for processing import/include XML nodes}
\description{
  This function is used, by default, when using regular R-level nodes
  (as opposed to internal/C-level nodes) when parsing an XML
  schema document. The function returns two functions which
  are used by the XML parser \code{\link[XML]{xmlTreeParse}}
  to convert import and include nodes within the XML schema
  by resolving the name of the referenced file and
  reading that document as another XML schema and inserting
  the results into the document.

  It is often more convenient to use internal/C-level  nodes
  and so use \code{\link[XML]{xmlParse}} rather than
  \code{\link[XML]{xmlTreeParse}}. The former does not
  use these handler functions.
}
\usage{
WSDLParseHandlers(baseURI, verbose = FALSE, keepSchema = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{baseURI}{the name of the parent/containing document being read,
    relative to which the \code{href} attribute of an import or include
    node will be resolved.}
  \item{verbose}{ a logical indicating whether to emit messages to the
    console when processing an import or include node.}
  \item{keepSchema}{a logical value indicating whether to assign the
    resulting schema from processing an include or import node
    to the list of schema, indexed by the namespace prefix.
  }
}
\value{
 A named list of functions.
}
\references{
 The XML schema specification at \url{http://www.w3.org/XML/Schema}.  
}
\author{Duncan Temple Lang}

\seealso{
  \code{readSchema} in the XMLSchema package
  and \code{\link{processWSDL}}.
}
\examples{
}
\keyword{programming}
\concept{XML schema}
