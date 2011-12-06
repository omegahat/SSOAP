body = "<?xml version='1.0' encoding='UTF-8'?>\r\n<SOAP-ENV:Envelope\r\nxmlns:SOAP-ENC=\"http://schemas.xmlsoap.org/soap/encoding/\"\r\nxmlns:SOAP-ENV=\"http://schemas.xmlsoap.org/soap/envelope/\"\r\nxmlns:xsi=\"http://www.w3.org/1999/XMLSchema-instance\"\r\nxmlns:xsd=\"http://www.w3.org/1999/XMLSchema\"\r\nSOAP-ENV:encodingStyle=\"http://schemas.xmlsoap.org/soap/encoding/\">\r\n<SOAP-ENV:Body>\r\n<namesp1:getRate xmlns:namesp1=\"urn:xmethods-CurrencyExchange\">\n<country1 xsi:type=\"xsd:string\">England</country1>\r\n<country2 xsi:type=\"xsd:string\">Japan</country2>\r\n</namesp1:getRate>\r\n</SOAP-ENV:Body>\r\n</SOAP-ENV:Envelope>\r"


curlPerform(url = "http://services.xmethods.net/soap",
            httpheader=c(Accept="text/xml", Accept="multipart/*",
                         'Content-Type' = "text/xml; charset=utf-8",
                         SOAPAction="urn:xmethods-CurrencyExchange#getRate#getRate"),
            postfields=body,
            verbose = TRUE
            )
