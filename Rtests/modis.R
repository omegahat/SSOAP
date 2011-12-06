body =  "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<SOAP-ENV:Envelope SOAP-ENV:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\" \n                   xmlns:SOAP-ENV=\"http://schemas.xmlsoap.org/soap/envelope/\" \n                   xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" \n                   xmlns:SOAP-ENC=\"http://schemas.xmlsoap.org/soap/encoding/\" \n                   xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\">\n  <SOAP-ENV:Body>\n       <namesp1:hi xmlns:namesp1=\"http://www.soaplite.com/Demo\"/>\n  </SOAP-ENV:Body>\n</SOAP-ENV:Envelope>\n"

wsdlurl = 'http://daac.ornl.gov/cgi-bin/MODIS/GLBVIZ_1_Glb_subset/MODIS_webservice.wsdl'

url = "http://daac.ornl.gov/cgi-bin/MODIS/GLBVIZ_1_Glb_subset/MODIS_webservice.pl"
curlPerform(url= url,
             httpheader=c(Accept="text/xml; multipart/*",
                          SOAPAction='"http://www.soaplite.com/Demo#hi"',
                         'Content-Type' = "text/xml; charset=utf-8"),
             postfields=body,
             verbose = TRUE
            )

