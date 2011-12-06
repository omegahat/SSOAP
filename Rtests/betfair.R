library(SSOAP)
library(RCurl)
library(XML)
library(XMLSchema)

## 1. processWSDL does not support https,  using RCurl:
#write(getURI("https://api.betfair.com/global/v3/BFGlobalService.wsdl"), "BFGlobalService.wsdl")
#
#  Yep. Nor does it allow one to make arbitrary and rich HTTP requests to get the document,
#  e.g. specifying the user-agent, providing cookies, passwords or general authentication,
#       controlling lookup of certificates, etc.
#       or performing POST requests.
#  So RCurl or download.file() is to be used for getting XML documents when xmlParse() can't.

Gl <- processWSDL("~/BFGlobalService.wsdl.xml")

## 2.  defClass (used in genSOAPClientInterface) does not to handle correctly objects of class "Element":
glcls <- new.env(parent = globalenv())
glenv <- new.env(parent = glcls)
#gl <- genSOAPClientInterface(, Gl, verbose = T, env = glenv, where = glcls, force = T)
gl <- genSOAPClientInterface(, Gl, verbose = TRUE, force = TRUE)
gl@classes[[2]] ##  pending definition and NA for all
sapply(Gl@types[[2]], class)

# The problem is that many elements ahve the same name as 
## I could solve it by inserting         remove(list = name, envir = pending)
## just before         def = defClass(i@type, where, namespaceDefs, ...
## in defClass definition in XMLSchema package.

## In what follows I assume the above correction and that the login class is installed.

### 3.  writeSOAPMessage (used in .SOAP) does not write the slot values in xml document:
getClass("login", where = glcls)
getClass("LoginReq", where = glcls)

req <- new("LoginReq",
           password = "xxx",
           username = "bbbb",
           ipAddress = "0",
           locationId = 0L,
           productId = 82L,
           vendorSoftwareId = 0L)
#setClass("login", representation(request = "LoginReq"))
log_req <- new("login", request = req)

.operation <- get(".operation", environment(gl@functions$login))
.defaultServer <- get(".defaultServer", environment(gl@functions$login))
.header <- get(".header", environment(gl@functions$login))

n = newXMLNode("call")
toSOAP(req, n, type = .operation@parameters[[1]], literal = TRUE)


doc <- newXMLDoc()
writeSOAPMessage(doc, nameSpaces = SOAPNameSpaces(),  method = .operation@name,
                 log_req,
                 .types = .operation@parameters, xmlns = .operation@namespace, .literal = TRUE)

#  This is caused by creating xmlTextNode with no parent node and so they disappear into the ether.
#  This was noted in a comment, but not fixed until now. Thanks.


### GIVES:
## ...
## <request>
##   <ipAddress/>
##   <locationId/>
##   <password/>
##   <productId/>
##   <username/>
##   <vendorSoftwareId/>
## </request>
## ...

### instead of
## <request>
##   <ipAddress>0 </ipAddress>
##   <locationId>0 </ipAddress >
##   <password>xxx </password >
##   <productId> 82 </productId >
##   <username> bbb </username >
##   <vendorSoftwareId>0 </vendorSoftwareId >
## </request>
## ...

### 4. fromXML runs into infinite recursion when trying to convert an object of class "RestrictedStringDefinition"
type <- .operation@returnValue
cont <- "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<soap:Envelope xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:n2=\"http://www.betfair.com/publicapi/types/global/v3/\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\"><soap:Body><n:loginResponse xmlns:n=\"http://www.betfair.com/publicapi/v3/BFGlobalService/\"><n:Result xsi:type=\"n2:LoginResp\"><header xsi:type=\"n2:APIResponseHeader\"><errorCode xsi:type=\"n2:APIErrorEnum\">PRODUCT_REQUIRES_FUNDED_ACCOUNT</errorCode><minorErrorCode xsi:nil=\"1\"></minorErrorCode><sessionToken xsi:nil=\"1\"></sessionToken><timestamp xsi:type=\"xsd:dateTime\">2011-05-19T15:15:51.024Z</timestamp></header><currency xsi:nil=\"1\"></currency><errorCode xsi:type=\"n2:LoginErrorEnum\">API_ERROR</errorCode><minorErrorCode xsi:nil=\"1\"></minorErrorCode><validUntil xsi:type=\"xsd:dateTime\">0001-01-01T00:00:00.000Z</validUntil></n:Result></n:loginResponse></soap:Body></soap:Envelope>"
head <- structure(c("Thu, 19 May 2011 15:15:50 GMT", "text/xml;charset=UTF-8",
                    "951", "NSC_mc-80-qvcbqj.efgbvmu=ffffffff09208c3b45525d5f4f58455e445a4a4229a0;expires=Fri, 20-May-2011 03:15:51 GMT;path=/;httponly",
                    "200", "OK\r\n"), .Names = c("Date", "Content-Type", "Content-Length",
                                        "Set-Cookie", "status", "statusMessage"))

convertFromSOAP(SOAPResult(cont, head), type) ## infinite recursion

node <- SSOAP:::parseSOAP(cont, asText = TRUE)
node <- getReturnNode(node)
fromXML(node[[1]][["errorCode"]], type = type@slotTypes[[1]]@slotTypes[["errorCode"]]) ## infinite recursion
