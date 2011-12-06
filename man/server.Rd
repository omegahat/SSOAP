\name{server}
\alias{server}
\alias{returnType}
\alias{returnConverter}
\alias{help}
\alias{returnConverter,WSDLGeneratedSOAPFunction-method}
\alias{returnType,WSDLGeneratedSOAPFunction-method}
\alias{server,WSDLGeneratedSOAPFunction-method}
\title{Information about a programmatically generated function}
\description{
 These functions provide information about a function
 that was programmatically created by processing a WSDL file.
 It allows the R user to find out characteristics of these
 functions without having to understand the particular structure
 of the functions, i.e. the environments and the meta-data being
 stored in that environment and the default server object
 in a parent environment shared by all the generated functions.

 The help function merely  makes the regular help function in
 base generic.

 When these functions are serialized and written to a file,
 these  methods no longer work at present. This can be remedied.
  
 
}
\usage{
server(fun, ...)
returnType(fun, ...)
returnConverter(fun, ...)
}
\arguments{
  \item{fun}{the function object whose characteristics are being queried. This is a programatically generated 
       function as part of the WSDL processing.  This should be of class \code{WSDLGeneratedSOAPFunction}.}
  \item{\dots}{ additional arguments so that these generic functions can be useful to other packages.}
}
\value{
 These merely provide information about the contents of the
environment of the generated function.
}

\author{Duncan Temple Lang}
\note{ 
When they are serialized to a file, this information is no longer available
at present
}
\seealso{
 \code{\link{processWSDL}}
}
\examples{
}
\keyword{programming}
\concept{reflection}
\concept{meta-programming}

