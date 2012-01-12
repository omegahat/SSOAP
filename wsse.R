library(SSOAP)

auth = new("WSSEAuth", username = "my.username", password = "my.password")
hdr = as(auth, "XMLInternalNode")

myserver <- SOAPServer("localhost", "VitSec/public/ws", 80)
.SOAP(server=myserver, method="myMethod", param1="foobar", action=I("VersionHttpSoap11Endpoint"), .soapHeader = hdr)

