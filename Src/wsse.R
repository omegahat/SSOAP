WSSENs = c("http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd")

tmp = function(from) {
        hdr = newXMLNode("wsse:Security", attrs = if(from@required) c("mustUnderstand" = "true") else character(),
                           namespaceDefinitions = c("wsse"= WSSENs))
        newXMLNode("wsse:UsernameToken",
                    newXMLNode("wsse:Username", from@username, suppressNamespaceWarning = TRUE),
                    newXMLNode("wsse:Password", from@password, suppressNamespaceWarning = TRUE), parent = hdr)
        hdr
      }

setAs("WSSEAuth", "XMLInternalElementNode", tmp)
setAs("WSSEAuth", "XMLInternalNode", tmp)

