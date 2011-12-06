\name{SOAPServer}
\alias{SOAPServer}
\alias{dynamicSOAPServer}
\title{Create a SOAP server object}
\description{
  These are constructors for the basic \code{SOAPServer} class
  which represent the location of the web services
  and methods.
  The basic \code{\link{SOAPServer-class}}
   is used to identify the host, port and URL of a SOAP
   server.
   The dynamic SOAP server is represented by 
   the class \code{\link{DynamicSOAPServer-class}}
   and that contains not only the location of the
   SOAP server, but also information about its methods
   and data types.  This information is typically read from
   a Web Services Description Language (WSDL) file.

   We can use the form
    \code{server$method(arg1, arg2, ...)}
   to invoke a method in both types of server.
}
\usage{
SOAPServer(host, url, port = NA, s = new(className))
dynamicSOAPServer(iface, obj = new("DynamicSOAPServer"))
}
%- maybe also `usage' for other objects documented here.
\arguments{
  \item{host}{typically, the name of the host machine,
    e.g. \code{"www.omegahat.org"}.
    Alternatively, a complete URL (e.g. \code{http://www.omegahat.org/SOAP})
    may be given as the value for host and the individual
    parts are extracted from this.
  }
    \item{url}{the file/URL within the server that contains the SOAP
      server. If this is omitted, we attempt to find the value
    from the value of \code{host}.}
    \item{port}{the port number on which the server is listening.
      This is typically 80, the standard HTTP port. However, one can
      specify  this when creating the S server object to
      identify a different port. This is useful when testing
      a server since one can use a user-level port.
      It is left as \code{NA} if not specified to indicate that it was
      not explicitly set to 80.
     }
    \item{s}{the object being created and initialized.
      Having this as an argument allows the caller to specify
      the class of the desired object and supply a partially initialized
      value and still get the ``standard'' initialization for the server
      object.
      \code{className} is computed in the body of the function and this
      mechanism works via lazy evaluation.
    }
    \item{iface}{
      this is an object of class
        \code{\link{SOAPClientInterface-class}}
      typically returned from a call to
      \code{\link{genSOAPClientInterface}}.
      This represents the collection of methods that the SOAP
      server provides.
     }.
    \item{obj}{the object that will be returned from
      the  \code{dymanicSOAPServer} function. This is specified
      with a default value so that this constructor can be easily reused
      for derived classes.
      Typically, a user-level call to this function will not
      need to specify this.}
}
\note{
  In the future, we will use a \code{SOAPConnection}
  class that builds on the server and maintains a
  connection to the server.
  The URL may get dropped from the server as we can use
  the same basic host and port combination with different
  URLs for different requests. Experience will give us
  a better handle on an appropriate interface.

  Also, we may store a server-specific, default SOAPAction value in the server.
}    
\value{
  An object of class \code{HTTPSOAPServer},
  \code{FTPSOAPServer} or \code{SOAPServer}.
  If the host is specified with an \code{ftp:} or \code{http:}
  prefix, an object of class \code{FTPSOAPServer} or
  \code{HTTPSOAPServer} respectively is returned.
  Otherwise, a generic \code{SOAPServer} is created.
}
\references{
  \url{http://www.w3.org/TR/SOAP/}
  \url{http://www.omegahat.org/SSOAP},
  \url{http://www.omegahat.org/bugs}.
}
\author{Duncan Temple Lang <duncan@wald.ucdavis.edu>}
\seealso{
 \code{\link{.SOAP}}
 \code{\link[base]{$}}
}

\examples{
server = SOAPServer("www.nanonull.com", "TimeService/TimeService.asmx")
}
\keyword{interface}
\keyword{connection}
