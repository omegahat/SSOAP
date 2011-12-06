\name{toSOAP}
\alias{toSOAP}
\alias{toSOAP,vector,ANY,NULL-method}
\alias{toSOAP,vector,ANY,PrimitiveSOAPType-method}
\alias{toSOAP,vector,ANY,SOAPType-method}
\alias{toSOAP,list,ANY,NULL-method}
\alias{toSOAP,ANY,ANY,ArrayType-method}
\alias{toSOAP,ANY,ANY,ClassDefinition-method}
\alias{toSOAP,POSIXt,ANY,SOAPDateType-method}
\alias{toSOAP,date,ANY,SOAPDateType-method}
\alias{toSOAP,POSIXt,ANY,SOAPDateTimeType-method}
\alias{toSOAP,POSIXt,ANY,SOAPTimeType-method}
\alias{toSOAP,vector,XMLInternalDocument,PrimitiveSOAPType-method}
\alias{toSOAP,vector,connection,PrimitiveSOAPType-method}
\alias{toSOAP,vector,XMLInternalElementNode,BasicSOAPType-method}
\alias{as.SOAPDateTime}
\alias{as.SOAPDate}
\alias{toSOAP,ANY,ANY,SOAPType-method}
\alias{toSOAP,vector,XMLInternalElementNode,missing-method}

\alias{toSOAP,ANY,XMLInternalElementNode,Element-method}
\alias{toSOAP,ANY,XMLInternalElementNode,LocalElement-method}
\alias{toSOAP,ANY,XMLInternalElementNode,ArrayType-method}
\alias{toSOAP,list,XMLInternalElementNode,ArrayType-method}
\alias{toSOAP,vector,XMLInternalElementNode,ArrayType-method}
\alias{toSOAP,vector,XMLInternalElementNode,SimpleSequenceType-method}


\title{Convert S object to SOAP format}
\description{
  This converts an S object to its SOAP representation,
  writing it out to a connection.
}
\usage{
toSOAP(obj, con = xmlOutputBuffer(header = ""), type = NULL,
       literal = FALSE, elementFormQualified = FALSE, ...)
}
\arguments{
  \item{obj}{the S object to be described in SOAP format}
  \item{con}{the connection on which to write the SOAP representation,
    usually a connection to a SOAP server.}
  \item{type}{an object that describes the target type, if available.
    This is typically an object which is derived from
    \code{\link{SOAPType-class}} that describes the details of the
    particular type.}
  \item{literal}{a logical value indicating whether to use the literal
    format of the encoding for the seralization of objects.}
  \item{elementFormQualified}{a logical value that indicates whether the
  nodes are to use no namespace or the target namespace of the schema in
   which they were defined.}
  \item{...}{additional parameters for the methods of this generic}
}
\value{
  The side-effect of writing the representation to the
  connection is the important aspect of this.
}
\references{
  \url{http://www.w3.org/TR/SOAP/}
  \url{http://www.omegahat.org/SSOAP},
  \url{http://www.omegahat.org/bugs}.
}
\author{Duncan Temple Lang <duncan@wald.ucdavis.edu>}

\seealso{
\code{\link{.SOAP}}
}

\examples{
}
\keyword{interface}
\keyword{connection}
