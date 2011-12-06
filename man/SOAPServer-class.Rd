\name{SOAPServer-class}
\docType{class}
\alias{SOAPServer-class}
\alias{DynamicSOAPServer-class}
\alias{HTTPSOAPServer-class}
\alias{HTTPSSOAPServer-class}
\alias{$,SOAPServer-method}
\alias{$,DynamicSOAPServer-method}
\alias{names,DynamicSOAPServer-method}
\title{Classes for SOAP Server object}
\description{
 These classes provide a way to describe the location of a SOAP server.
 This is separate from the servers actions.  Rather, we use this to 
 represent the identity of the server in terms of its Web address,
  i.e.  the machine name or IP address, port number and URI or path within
  the server.  The different classes represent the communication protocol,
  typically HTTP or HTTPS, i.e. HTTP over SSL, the secure communication protocol.

  A DynamicSOAPServer might be better termed a
  ``compiled'' server.  It contains information about the methods and
  data types accessible via the server.
  This information is converted into R classes and functions
  that can be used to invoke the server's methods.

  DynamicSOAPServer does not extend SOAPServer currently. Rather,
  it contains a SOAPServer.  This is because we need to be able
  to determine the protocol and so have different types of
  SOAPServer objects associated with the interface methods.
  This class hierarchy may change in the future.
}

\section{Objects from the Class}{
The function  \code{\link{SOAPServer}} is used as the general constructor.
Alternatively, one can use the \code{\link{new}} syntax,
\code{new("HTTPServer", host = "www.omegahat.org", url = "theServer")}
}
\section{Slots}{
  \describe{
    \item{\code{host}:}{Object of class \code{"character"}. The machine name or IP address of the server.}
    \item{\code{port}:}{Object of class \code{"integer"}. The port number, if other than the default HTTP port 80. }
    \item{\code{url}:}{Object of class \code{"character"}.  The document within the server that is the location of the server.}
  }
}
\section{Methods}{
  \describe{
    \item{\$}{\code{signature(x = "SOAPServer", name = "character")}: 
       returns a function that will invoke the server's method whose name is given by \code{name}.
       This is merely syntactic sugar to allow the expression
        \code{server\$foo(1, 2, 3)}  to invoke the method foo in the
	remote server.}
    \item{\$}{\code{signature(x = "DynamicSOAPServer", name = "character")}: 
       returns a function that will invoke the server's method whose name is given by \code{name}.
       This is merely syntactic sugar to allow the expression
        \code{server\$foo(1, 2, 3)}  to invoke the method foo in the
	remote server.} 
      \item{names}{\code{signature(x = "DynamicSOAPServer")}}{
          returns the names of the server's available methods.
      }
  }
}

\references{
  \url{http://www.w3.org/TR/SOAP/}
  \url{http://www.omegahat.org/SSOAP},
  \url{http://www.omegahat.org/bugs}.
}
\author{Duncan Temple Lang <duncan@wald.ucdavis.edu>}


\seealso{
  \code{\link{SOAPServer}}
}
\examples{

}
\keyword{classes}
\keyword{IO}
