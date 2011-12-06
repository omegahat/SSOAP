library(SSOAP)
w = processWSDL("~/TestService.wsdl")
iface = genSOAPClientInterface(def = w)
