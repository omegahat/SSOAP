.SOAP(SOAPServer("services.xmethods.net", "soap"), "getRate", country1="England", country2 = "Japan", action="urn:xmethods-CurrencyExchange#getRate", xmlns=c(namesp1="urn:xmethods-CurrencyExchange"))

.SOAP(SOAPServer("services.xmethods.net", "soap/servlet/rpcrouter"), "getPrice", "0596000278", action="urn:xmethods-BNPriceCheck#getPrice", xmlns=c(namesp1="urn:xmethods-BNPriceCheck"))

.SOAP(SOAPServer("services.xmethods.net", "soap"), "getQuote", "AMZN", action="urn:xmethods-delayed-quotes#getQuote", xmlns=c(namesp1="urn:xmethods-delayed-quotes"))


.SOAP(SOAPServer("services.soaplite.com", "temper.cgi"), "c2f", 37.5, action="http://www.soaplite.com/Temperatures")


s1 <- SOAPServer("services.soaplite.com", "interop.cgi")
.SOAP(s1, "echoString", "From R", action="urn:soapinterop", xmlns=c(namesp1="http://soapinterop.org/"), handlers =NULL)
