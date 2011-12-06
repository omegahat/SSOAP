h = getCurlHandle(verbose = TRUE)
#http://schemas.xmlsoap.org/soap/envelope/

s <- SOAPServer("http://river.sdsc.edu/NWISTS/nwis.asmx")
.SOAP(s, "GetSiteInfo", SiteInfo = '18050002',
       action = I("http://tempuri.org/NWISTS/NWIS2/GetSiteInfo"),
       xmlns = c(namesp1 = "http://tempuri.org/NWISTS/NWIS2"),
       nameSpaces = unlist(merge(list("SOAP-ENV" = "http://schemas.xmlsoap.org/soap/envelope/"), SOAPNameSpaces(version = "1.2"))),
       curlHandle = h)
