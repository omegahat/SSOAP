library(SSOAP); library(XMLSchema)
XMLSchema:::parseSchemaDoc
sc = XMLSchema:::parseSchemaDoc("ops.xsd")
rt = getNodeSet(sc, "//*[@name='application-referenceType']")
XMLSchema:::getTargetNamespace(rt[[1]])
