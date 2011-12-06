library(SSOAP)
setClass( 'ArrayOfString' ,
	   representation(
		.Data = 'character') ,
	   contains = c( 'character' )
 ) 
setClass( 'mass.range.dbs' ,
	   representation(
		mass = 'numeric',
		range = 'numeric',
		dbs = 'ArrayOfString') ,
	   contains = c( 'VirtualSOAPClass' )
 ) 
setClass( 'mass.range' ,
	   representation(
		mass = 'numeric',
		range = 'numeric') ,
	   contains = c( 'VirtualSOAPClass' )
 ) 
setClass( 'formula.dbs' ,
	   representation(
		formula = 'character',
		dbs = 'ArrayOfString') ,
	   contains = c( 'VirtualSOAPClass' )
 ) 
setClass( 'csid.calc3d.token' ,
	   representation(
		csid = 'character',
		calc3d = 'logical',
		token = 'character') ,
	   contains = c( 'VirtualSOAPClass' )
 ) 
setClass( 'rid.token.eComp' ,
	   representation(
		rid = 'character',
		token = 'character',
		eComp = 'ECompression') ,
	   contains = c( 'VirtualSOAPClass' )
 ) 
setClass( 'rid.token' ,
	   representation(
		rid = 'character',
		token = 'character') ,
	   contains = c( 'VirtualSOAPClass' )
 ) 
setClass( 'CSID.token' ,
	   representation(
		CSID = 'integer',
		token = 'character') ,
	   contains = c( 'VirtualSOAPClass' )
 ) 
setClass( 'ExtendedCompoundInfo' ,
	   representation(
		CSID = 'integer',
		MF = 'character',
		SMILES = 'character',
		InChI = 'character',
		InChIKey = 'character',
		AverageMass = 'numeric',
		MolecularWeight = 'numeric',
		MonoisotopicMass = 'numeric',
		NominalMass = 'numeric',
		ALogP = 'numeric',
		XLogP = 'numeric',
		CommonName = 'character') ,
	   contains = c( 'VirtualSOAPClass' )
 ) 
setClass( 'CSIDs.token' ,
	   representation(
		CSIDs = 'ArrayOfInt',
		token = 'character') ,
	   contains = c( 'VirtualSOAPClass' )
 ) 
setClass( 'ArrayOfExtendedCompoundInfo' ,
	   representation(
		.Data = 'list') ,
	   contains = c( 'list' )
 ) 
setClass( 'mass.range.dbs.token' ,
	   representation(
		mass = 'numeric',
		range = 'numeric',
		dbs = 'ArrayOfString',
		token = 'character') ,
	   contains = c( 'VirtualSOAPClass' )
 ) 
setClass( 'formula.dbs.token' ,
	   representation(
		formula = 'character',
		dbs = 'ArrayOfString',
		token = 'character') ,
	   contains = c( 'VirtualSOAPClass' )
 ) 
setClass( 'StringArray' ,
	   representation(
		.Data = 'character') ,
	   contains = c( 'character' )
 ) 
GetDatabases = 
function (server = new("HTTPSOAPServer", host = "www.chemspider.com", 
    port = NA_integer_, url = "/MassSpecAPI.asmx"), .convert = new("LocalElement", 
    count = c(0, 1), type = new("SimpleSequenceType", elementType = character(0), 
        elType = new("PrimitiveSOAPType", fromConverter = function () 
        NULL, toConverter = .Primitive("as.character"), count = c(0, 
        Inf), abstract = logical(0), name = "string", ns = "s", 
            nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
            documentation = character(0)), fromConverter = function () 
        NULL, toConverter = function () 
        NULL, count = c(0, Inf), abstract = logical(0), name = "ArrayOfString", 
        ns = character(0), nsuri = "http://www.chemspider.com/", 
        Rname = character(0), documentation = character(0)), 
    name = "GetDatabasesResult", attributes = list(), xmlAttrs = character(0), 
    ns = character(0), nsuri = "http://www.chemspider.com/", 
    Rname = character(0), documentation = character(0)), .opts = list(), 
    nameSpaces = "1.2", .soapHeader = NULL) 
{
    .SOAP(server, "GetDatabases", action = "http://www.chemspider.com/GetDatabases", 
        xmlns = "http://www.chemspider.com/", .types = list(), 
        .convert = .convert, .header = c(Accept = "text/xml", 
            Accept = "multipart/*", `Content-Type` = "text/xml; charset=utf-8", 
            SOAPAction = "\"http://www.chemspider.com/GetDatabases\""), 
        .opts = .opts, .literal = TRUE, nameSpaces = nameSpaces, 
        .elementFormQualified = TRUE, .returnNodeName = "GetDatabasesResponse", 
        .soapHeader = .soapHeader)
}

class( GetDatabases ) = c( 'SerializedFunction', 'WSDLGeneratedSOAPFunction' )

SearchByMass = 
function (parameters = list(...), ..., server = new("HTTPSOAPServer", 
    host = "www.chemspider.com", port = NA_integer_, url = "/MassSpecAPI.asmx"), 
    .convert = new("LocalElement", count = c(0, 1), type = new("SimpleSequenceType", 
        elementType = character(0), elType = new("PrimitiveSOAPType", 
            fromConverter = function () 
            NULL, toConverter = .Primitive("as.character"), count = c(0, 
            Inf), abstract = logical(0), name = "string", ns = "s", 
            nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
            documentation = character(0)), fromConverter = function () 
        NULL, toConverter = function () 
        NULL, count = c(0, Inf), abstract = logical(0), name = "ArrayOfString", 
        ns = character(0), nsuri = "http://www.chemspider.com/", 
        Rname = character(0), documentation = character(0)), 
        name = "SearchByMassResult", attributes = list(), xmlAttrs = character(0), 
        ns = character(0), nsuri = "http://www.chemspider.com/", 
        Rname = character(0), documentation = character(0)), 
    .opts = list(), nameSpaces = "1.2", .soapHeader = NULL) 
{
    .SOAP(server, "SearchByMass", parameters = as(parameters, 
        "mass.range.dbs"), action = "http://www.chemspider.com/SearchByMass", 
        xmlns = "http://www.chemspider.com/", .types = list(parameters = new("Element", 
            type = new("ClassDefinition", slotTypes = list(mass = new("PrimitiveSOAPType", 
                fromConverter = function () 
                NULL, toConverter = .Primitive("as.double"), 
                count = c(1, 1), abstract = logical(0), name = "double", 
                ns = "s", nsuri = "http://www.w3.org/2001/XMLSchema", 
                Rname = character(0), documentation = character(0)), 
                range = new("PrimitiveSOAPType", fromConverter = function () 
                NULL, toConverter = .Primitive("as.double"), 
                  count = c(1, 1), abstract = logical(0), name = "double", 
                  ns = "s", nsuri = "http://www.w3.org/2001/XMLSchema", 
                  Rname = character(0), documentation = character(0)), 
                dbs = new("SimpleSequenceType", elementType = character(0), 
                  elType = new("PrimitiveSOAPType", fromConverter = function () 
                  NULL, toConverter = .Primitive("as.character"), 
                    count = c(0, Inf), abstract = logical(0), 
                    name = "string", ns = "s", nsuri = "http://www.w3.org/2001/XMLSchema", 
                    Rname = character(0), documentation = character(0)), 
                  fromConverter = function () 
                  NULL, toConverter = function () 
                  NULL, count = c(0, Inf), abstract = logical(0), 
                  name = "ArrayOfString", ns = character(0), 
                  nsuri = "http://www.chemspider.com/", Rname = character(0), 
                  documentation = character(0))), isAttribute = c(FALSE, 
            FALSE, FALSE), uris = c("http://www.chemspider.com/", 
            "http://www.chemspider.com/", "http://www.chemspider.com/"
            ), fromConverter = function () 
            NULL, toConverter = function () 
            NULL, count = numeric(0), abstract = logical(0), 
                name = "mass.range.dbs", ns = character(0), nsuri = "http://www.chemspider.com/", 
                Rname = character(0), documentation = character(0)), 
            name = "SearchByMass", attributes = list(), xmlAttrs = character(0), 
            ns = character(0), nsuri = "http://www.chemspider.com/", 
            Rname = character(0), documentation = character(0))), 
        .convert = .convert, .header = c(Accept = "text/xml", 
            Accept = "multipart/*", `Content-Type` = "text/xml; charset=utf-8", 
            SOAPAction = "\"http://www.chemspider.com/SearchByMass\""), 
        .opts = .opts, .literal = TRUE, nameSpaces = nameSpaces, 
        .elementFormQualified = TRUE, .returnNodeName = "SearchByMassResponse", 
        .soapHeader = .soapHeader)
}

class( SearchByMass ) = c( 'SerializedFunction', 'WSDLGeneratedSOAPFunction' )

SearchByMass2 = 
function (parameters = list(...), ..., server = new("HTTPSOAPServer", 
    host = "www.chemspider.com", port = NA_integer_, url = "/MassSpecAPI.asmx"), 
    .convert = new("LocalElement", count = c(0, 1), type = new("SimpleSequenceType", 
        elementType = character(0), elType = new("PrimitiveSOAPType", 
            fromConverter = function () 
            NULL, toConverter = .Primitive("as.character"), count = c(0, 
            Inf), abstract = logical(0), name = "string", ns = "s", 
            nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
            documentation = character(0)), fromConverter = function () 
        NULL, toConverter = function () 
        NULL, count = c(0, Inf), abstract = logical(0), name = "ArrayOfString", 
        ns = character(0), nsuri = "http://www.chemspider.com/", 
        Rname = character(0), documentation = character(0)), 
        name = "SearchByMass2Result", attributes = list(), xmlAttrs = character(0), 
        ns = character(0), nsuri = "http://www.chemspider.com/", 
        Rname = character(0), documentation = character(0)), 
    .opts = list(), nameSpaces = "1.2", .soapHeader = NULL) 
{
    .SOAP(server, "SearchByMass2", parameters = as(parameters, 
        "mass.range"), action = "http://www.chemspider.com/SearchByMass2", 
        xmlns = "http://www.chemspider.com/", .types = list(parameters = new("Element", 
            type = new("ClassDefinition", slotTypes = list(mass = new("PrimitiveSOAPType", 
                fromConverter = function () 
                NULL, toConverter = .Primitive("as.double"), 
                count = c(1, 1), abstract = logical(0), name = "double", 
                ns = "s", nsuri = "http://www.w3.org/2001/XMLSchema", 
                Rname = character(0), documentation = character(0)), 
                range = new("PrimitiveSOAPType", fromConverter = function () 
                NULL, toConverter = .Primitive("as.double"), 
                  count = c(1, 1), abstract = logical(0), name = "double", 
                  ns = "s", nsuri = "http://www.w3.org/2001/XMLSchema", 
                  Rname = character(0), documentation = character(0))), 
                isAttribute = c(FALSE, FALSE), uris = c("http://www.chemspider.com/", 
                "http://www.chemspider.com/"), fromConverter = function () 
                NULL, toConverter = function () 
                NULL, count = numeric(0), abstract = logical(0), 
                name = "mass.range", ns = character(0), nsuri = "http://www.chemspider.com/", 
                Rname = character(0), documentation = character(0)), 
            name = "SearchByMass2", attributes = list(), xmlAttrs = character(0), 
            ns = character(0), nsuri = "http://www.chemspider.com/", 
            Rname = character(0), documentation = character(0))), 
        .convert = .convert, .header = c(Accept = "text/xml", 
            Accept = "multipart/*", `Content-Type` = "text/xml; charset=utf-8", 
            SOAPAction = "\"http://www.chemspider.com/SearchByMass2\""), 
        .opts = .opts, .literal = TRUE, nameSpaces = nameSpaces, 
        .elementFormQualified = TRUE, .returnNodeName = "SearchByMass2Response", 
        .soapHeader = .soapHeader)
}

class( SearchByMass2 ) = c( 'SerializedFunction', 'WSDLGeneratedSOAPFunction' )

SearchByFormula = 
function (parameters = list(...), ..., server = new("HTTPSOAPServer", 
    host = "www.chemspider.com", port = NA_integer_, url = "/MassSpecAPI.asmx"), 
    .convert = new("LocalElement", count = c(0, 1), type = new("SimpleSequenceType", 
        elementType = character(0), elType = new("PrimitiveSOAPType", 
            fromConverter = function () 
            NULL, toConverter = .Primitive("as.character"), count = c(0, 
            Inf), abstract = logical(0), name = "string", ns = "s", 
            nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
            documentation = character(0)), fromConverter = function () 
        NULL, toConverter = function () 
        NULL, count = c(0, Inf), abstract = logical(0), name = "ArrayOfString", 
        ns = character(0), nsuri = "http://www.chemspider.com/", 
        Rname = character(0), documentation = character(0)), 
        name = "SearchByFormulaResult", attributes = list(), 
        xmlAttrs = character(0), ns = character(0), nsuri = "http://www.chemspider.com/", 
        Rname = character(0), documentation = character(0)), 
    .opts = list(), nameSpaces = "1.2", .soapHeader = NULL) 
{
    .SOAP(server, "SearchByFormula", parameters = as(parameters, 
        "formula.dbs"), action = "http://www.chemspider.com/SearchByFormula", 
        xmlns = "http://www.chemspider.com/", .types = list(parameters = new("Element", 
            type = new("ClassDefinition", slotTypes = list(formula = new("PrimitiveSOAPType", 
                fromConverter = function () 
                NULL, toConverter = .Primitive("as.character"), 
                count = c(0, 1), abstract = logical(0), name = "string", 
                ns = "s", nsuri = "http://www.w3.org/2001/XMLSchema", 
                Rname = character(0), documentation = character(0)), 
                dbs = new("SimpleSequenceType", elementType = character(0), 
                  elType = new("PrimitiveSOAPType", fromConverter = function () 
                  NULL, toConverter = .Primitive("as.character"), 
                    count = c(0, Inf), abstract = logical(0), 
                    name = "string", ns = "s", nsuri = "http://www.w3.org/2001/XMLSchema", 
                    Rname = character(0), documentation = character(0)), 
                  fromConverter = function () 
                  NULL, toConverter = function () 
                  NULL, count = c(0, Inf), abstract = logical(0), 
                  name = "ArrayOfString", ns = character(0), 
                  nsuri = "http://www.chemspider.com/", Rname = character(0), 
                  documentation = character(0))), isAttribute = c(FALSE, 
            FALSE), uris = c("http://www.chemspider.com/", "http://www.chemspider.com/"
            ), fromConverter = function () 
            NULL, toConverter = function () 
            NULL, count = numeric(0), abstract = logical(0), 
                name = "formula.dbs", ns = character(0), nsuri = "http://www.chemspider.com/", 
                Rname = character(0), documentation = character(0)), 
            name = "SearchByFormula", attributes = list(), xmlAttrs = character(0), 
            ns = character(0), nsuri = "http://www.chemspider.com/", 
            Rname = character(0), documentation = character(0))), 
        .convert = .convert, .header = c(Accept = "text/xml", 
            Accept = "multipart/*", `Content-Type` = "text/xml; charset=utf-8", 
            SOAPAction = "\"http://www.chemspider.com/SearchByFormula\""), 
        .opts = .opts, .literal = TRUE, nameSpaces = nameSpaces, 
        .elementFormQualified = TRUE, .returnNodeName = "SearchByFormulaResponse", 
        .soapHeader = .soapHeader)
}

class( SearchByFormula ) = c( 'SerializedFunction', 'WSDLGeneratedSOAPFunction' )

SearchByFormula2 = 
function (parameters, server = new("HTTPSOAPServer", host = "www.chemspider.com", 
    port = NA_integer_, url = "/MassSpecAPI.asmx"), .convert = new("LocalElement", 
    count = c(0, 1), type = new("SimpleSequenceType", elementType = character(0), 
        elType = new("PrimitiveSOAPType", fromConverter = function () 
        NULL, toConverter = .Primitive("as.character"), count = c(0, 
        Inf), abstract = logical(0), name = "string", ns = "s", 
            nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
            documentation = character(0)), fromConverter = function () 
        NULL, toConverter = function () 
        NULL, count = c(0, Inf), abstract = logical(0), name = "ArrayOfString", 
        ns = character(0), nsuri = "http://www.chemspider.com/", 
        Rname = character(0), documentation = character(0)), 
    name = "SearchByFormula2Result", attributes = list(), xmlAttrs = character(0), 
    ns = character(0), nsuri = "http://www.chemspider.com/", 
    Rname = character(0), documentation = character(0)), .opts = list(), 
    nameSpaces = "1.2", .soapHeader = NULL) 
{
    .SOAP(server, "SearchByFormula2", parameters = as.character(parameters), 
        action = "http://www.chemspider.com/SearchByFormula2", 
        xmlns = "http://www.chemspider.com/", .types = list(parameters = new("LocalElement", 
            count = c(0, 1), type = new("PrimitiveSOAPType", 
                fromConverter = function () 
                NULL, toConverter = .Primitive("as.character"), 
                count = c(0, 1), abstract = logical(0), name = "string", 
                ns = "s", nsuri = "http://www.w3.org/2001/XMLSchema", 
                Rname = character(0), documentation = character(0)), 
            name = "formula", attributes = list(), xmlAttrs = character(0), 
            ns = character(0), nsuri = "http://www.chemspider.com/", 
            Rname = character(0), documentation = character(0))), 
        .convert = .convert, .header = c(Accept = "text/xml", 
            Accept = "multipart/*", `Content-Type` = "text/xml; charset=utf-8", 
            SOAPAction = "\"http://www.chemspider.com/SearchByFormula2\""), 
        .opts = .opts, .literal = TRUE, nameSpaces = nameSpaces, 
        .elementFormQualified = TRUE, .returnNodeName = "SearchByFormula2Response", 
        .soapHeader = .soapHeader)
}

class( SearchByFormula2 ) = c( 'SerializedFunction', 'WSDLGeneratedSOAPFunction' )

GetRecordMol = 
function (parameters = list(...), ..., server = new("HTTPSOAPServer", 
    host = "www.chemspider.com", port = NA_integer_, url = "/MassSpecAPI.asmx"), 
    .convert = new("LocalElement", count = c(0, 1), type = new("PrimitiveSOAPType", 
        fromConverter = function () 
        NULL, toConverter = .Primitive("as.character"), count = c(0, 
        1), abstract = logical(0), name = "string", ns = "s", 
        nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
        documentation = character(0)), name = "GetRecordMolResult", 
        attributes = list(), xmlAttrs = character(0), ns = character(0), 
        nsuri = "http://www.chemspider.com/", Rname = character(0), 
        documentation = character(0)), .opts = list(), nameSpaces = "1.2", 
    .soapHeader = NULL) 
{
    .SOAP(server, "GetRecordMol", parameters = as(parameters, 
        "csid.calc3d.token"), action = "http://www.chemspider.com/GetRecordMol", 
        xmlns = "http://www.chemspider.com/", .types = list(parameters = new("Element", 
            type = new("ClassDefinition", slotTypes = list(csid = new("PrimitiveSOAPType", 
                fromConverter = function () 
                NULL, toConverter = .Primitive("as.character"), 
                count = c(0, 1), abstract = logical(0), name = "string", 
                ns = "s", nsuri = "http://www.w3.org/2001/XMLSchema", 
                Rname = character(0), documentation = character(0)), 
                calc3d = new("PrimitiveSOAPType", fromConverter = function () 
                NULL, toConverter = .Primitive("as.logical"), 
                  count = c(1, 1), abstract = logical(0), name = "boolean", 
                  ns = "s", nsuri = "http://www.w3.org/2001/XMLSchema", 
                  Rname = character(0), documentation = character(0)), 
                token = new("PrimitiveSOAPType", fromConverter = function () 
                NULL, toConverter = .Primitive("as.character"), 
                  count = c(0, 1), abstract = logical(0), name = "string", 
                  ns = "s", nsuri = "http://www.w3.org/2001/XMLSchema", 
                  Rname = character(0), documentation = character(0))), 
                isAttribute = c(FALSE, FALSE, FALSE), uris = c("http://www.chemspider.com/", 
                "http://www.chemspider.com/", "http://www.chemspider.com/"
                ), fromConverter = function () 
                NULL, toConverter = function () 
                NULL, count = numeric(0), abstract = logical(0), 
                name = "csid.calc3d.token", ns = character(0), 
                nsuri = "http://www.chemspider.com/", Rname = character(0), 
                documentation = character(0)), name = "GetRecordMol", 
            attributes = list(), xmlAttrs = character(0), ns = character(0), 
            nsuri = "http://www.chemspider.com/", Rname = character(0), 
            documentation = character(0))), .convert = .convert, 
        .header = c(Accept = "text/xml", Accept = "multipart/*", 
            `Content-Type` = "text/xml; charset=utf-8", SOAPAction = "\"http://www.chemspider.com/GetRecordMol\""), 
        .opts = .opts, .literal = TRUE, nameSpaces = nameSpaces, 
        .elementFormQualified = TRUE, .returnNodeName = "GetRecordMolResponse", 
        .soapHeader = .soapHeader)
}

class( GetRecordMol ) = c( 'SerializedFunction', 'WSDLGeneratedSOAPFunction' )

GetCompressedRecordsSdf = 
function (parameters = list(...), ..., server = new("HTTPSOAPServer", 
    host = "www.chemspider.com", port = NA_integer_, url = "/MassSpecAPI.asmx"), 
    .convert = new("LocalElement", count = c(0, 1), type = new("PrimitiveSOAPType", 
        fromConverter = function (x) 
        new("Base64Encoded", xmlValue(x)), toConverter = function () 
        NULL, count = c(0, 1), abstract = logical(0), name = "base64Binary", 
        ns = "s", nsuri = "http://www.w3.org/2001/XMLSchema", 
        Rname = character(0), documentation = character(0)), 
        name = "GetCompressedRecordsSdfResult", attributes = list(), 
        xmlAttrs = character(0), ns = character(0), nsuri = "http://www.chemspider.com/", 
        Rname = character(0), documentation = character(0)), 
    .opts = list(), nameSpaces = "1.2", .soapHeader = NULL) 
{
    .SOAP(server, "GetCompressedRecordsSdf", parameters = as(parameters, 
        "rid.token.eComp"), action = "http://www.chemspider.com/GetCompressedRecordsSdf", 
        xmlns = "http://www.chemspider.com/", .types = list(parameters = new("Element", 
            type = new("ClassDefinition", slotTypes = list(rid = new("PrimitiveSOAPType", 
                fromConverter = function () 
                NULL, toConverter = .Primitive("as.character"), 
                count = c(0, 1), abstract = logical(0), name = "string", 
                ns = "s", nsuri = "http://www.w3.org/2001/XMLSchema", 
                Rname = character(0), documentation = character(0)), 
                token = new("PrimitiveSOAPType", fromConverter = function () 
                NULL, toConverter = .Primitive("as.character"), 
                  count = c(0, 1), abstract = logical(0), name = "string", 
                  ns = "s", nsuri = "http://www.w3.org/2001/XMLSchema", 
                  Rname = character(0), documentation = character(0)), 
                eComp = new("RestrictedStringDefinition", values = "eGzip", 
                  fromConverter = function (from, name = "ECompression") 
                  new(name, from), toConverter = function (from) 
                  as.character(from), count = numeric(0), abstract = logical(0), 
                  name = "ECompression", ns = "xsd", nsuri = "http://www.w3.org/2001/XMLSchema", 
                  Rname = character(0), documentation = character(0))), 
                isAttribute = c(FALSE, FALSE, FALSE), uris = c("http://www.chemspider.com/", 
                "http://www.chemspider.com/", "http://www.chemspider.com/"
                ), fromConverter = function () 
                NULL, toConverter = function () 
                NULL, count = numeric(0), abstract = logical(0), 
                name = "rid.token.eComp", ns = character(0), 
                nsuri = "http://www.chemspider.com/", Rname = character(0), 
                documentation = character(0)), name = "GetCompressedRecordsSdf", 
            attributes = list(), xmlAttrs = character(0), ns = character(0), 
            nsuri = "http://www.chemspider.com/", Rname = character(0), 
            documentation = character(0))), .convert = .convert, 
        .header = c(Accept = "text/xml", Accept = "multipart/*", 
            `Content-Type` = "text/xml; charset=utf-8", SOAPAction = "\"http://www.chemspider.com/GetCompressedRecordsSdf\""), 
        .opts = .opts, .literal = TRUE, nameSpaces = nameSpaces, 
        .elementFormQualified = TRUE, .returnNodeName = "GetCompressedRecordsSdfResponse", 
        .soapHeader = .soapHeader)
}

class( GetCompressedRecordsSdf ) = c( 'SerializedFunction', 'WSDLGeneratedSOAPFunction' )

GetRecordsSdf = 
function (parameters = list(...), ..., server = new("HTTPSOAPServer", 
    host = "www.chemspider.com", port = NA_integer_, url = "/MassSpecAPI.asmx"), 
    .convert = new("LocalElement", count = c(0, 1), type = new("PrimitiveSOAPType", 
        fromConverter = function () 
        NULL, toConverter = .Primitive("as.character"), count = c(0, 
        1), abstract = logical(0), name = "string", ns = "s", 
        nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
        documentation = character(0)), name = "GetRecordsSdfResult", 
        attributes = list(), xmlAttrs = character(0), ns = character(0), 
        nsuri = "http://www.chemspider.com/", Rname = character(0), 
        documentation = character(0)), .opts = list(), nameSpaces = "1.2", 
    .soapHeader = NULL) 
{
    .SOAP(server, "GetRecordsSdf", parameters = as(parameters, 
        "rid.token"), action = "http://www.chemspider.com/GetRecordsSdf", 
        xmlns = "http://www.chemspider.com/", .types = list(parameters = new("Element", 
            type = new("ClassDefinition", slotTypes = list(rid = new("PrimitiveSOAPType", 
                fromConverter = function () 
                NULL, toConverter = .Primitive("as.character"), 
                count = c(0, 1), abstract = logical(0), name = "string", 
                ns = "s", nsuri = "http://www.w3.org/2001/XMLSchema", 
                Rname = character(0), documentation = character(0)), 
                token = new("PrimitiveSOAPType", fromConverter = function () 
                NULL, toConverter = .Primitive("as.character"), 
                  count = c(0, 1), abstract = logical(0), name = "string", 
                  ns = "s", nsuri = "http://www.w3.org/2001/XMLSchema", 
                  Rname = character(0), documentation = character(0))), 
                isAttribute = c(FALSE, FALSE), uris = c("http://www.chemspider.com/", 
                "http://www.chemspider.com/"), fromConverter = function () 
                NULL, toConverter = function () 
                NULL, count = numeric(0), abstract = logical(0), 
                name = "rid.token", ns = character(0), nsuri = "http://www.chemspider.com/", 
                Rname = character(0), documentation = character(0)), 
            name = "GetRecordsSdf", attributes = list(), xmlAttrs = character(0), 
            ns = character(0), nsuri = "http://www.chemspider.com/", 
            Rname = character(0), documentation = character(0))), 
        .convert = .convert, .header = c(Accept = "text/xml", 
            Accept = "multipart/*", `Content-Type` = "text/xml; charset=utf-8", 
            SOAPAction = "\"http://www.chemspider.com/GetRecordsSdf\""), 
        .opts = .opts, .literal = TRUE, nameSpaces = nameSpaces, 
        .elementFormQualified = TRUE, .returnNodeName = "GetRecordsSdfResponse", 
        .soapHeader = .soapHeader)
}

class( GetRecordsSdf ) = c( 'SerializedFunction', 'WSDLGeneratedSOAPFunction' )

GetExtendedCompoundInfo = 
function (parameters = list(...), ..., server = new("HTTPSOAPServer", 
    host = "www.chemspider.com", port = NA_integer_, url = "/MassSpecAPI.asmx"), 
    .convert = new("LocalElement", count = c(1, 1), type = new("ClassDefinition", 
        slotTypes = list(CSID = new("PrimitiveSOAPType", fromConverter = function () 
        NULL, toConverter = .Primitive("as.integer"), count = c(1, 
        1), abstract = logical(0), name = "int", ns = "s", nsuri = "http://www.w3.org/2001/XMLSchema", 
            Rname = character(0), documentation = character(0)), 
            MF = new("PrimitiveSOAPType", fromConverter = function () 
            NULL, toConverter = .Primitive("as.character"), count = c(0, 
            1), abstract = logical(0), name = "string", ns = "s", 
                nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
                documentation = character(0)), SMILES = new("PrimitiveSOAPType", 
                fromConverter = function () 
                NULL, toConverter = .Primitive("as.character"), 
                count = c(0, 1), abstract = logical(0), name = "string", 
                ns = "s", nsuri = "http://www.w3.org/2001/XMLSchema", 
                Rname = character(0), documentation = character(0)), 
            InChI = new("PrimitiveSOAPType", fromConverter = function () 
            NULL, toConverter = .Primitive("as.character"), count = c(0, 
            1), abstract = logical(0), name = "string", ns = "s", 
                nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
                documentation = character(0)), InChIKey = new("PrimitiveSOAPType", 
                fromConverter = function () 
                NULL, toConverter = .Primitive("as.character"), 
                count = c(0, 1), abstract = logical(0), name = "string", 
                ns = "s", nsuri = "http://www.w3.org/2001/XMLSchema", 
                Rname = character(0), documentation = character(0)), 
            AverageMass = new("PrimitiveSOAPType", fromConverter = function () 
            NULL, toConverter = .Primitive("as.double"), count = c(1, 
            1), abstract = logical(0), name = "double", ns = "s", 
                nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
                documentation = character(0)), MolecularWeight = new("PrimitiveSOAPType", 
                fromConverter = function () 
                NULL, toConverter = .Primitive("as.double"), 
                count = c(1, 1), abstract = logical(0), name = "double", 
                ns = "s", nsuri = "http://www.w3.org/2001/XMLSchema", 
                Rname = character(0), documentation = character(0)), 
            MonoisotopicMass = new("PrimitiveSOAPType", fromConverter = function () 
            NULL, toConverter = .Primitive("as.double"), count = c(1, 
            1), abstract = logical(0), name = "double", ns = "s", 
                nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
                documentation = character(0)), NominalMass = new("PrimitiveSOAPType", 
                fromConverter = function () 
                NULL, toConverter = .Primitive("as.double"), 
                count = c(1, 1), abstract = logical(0), name = "double", 
                ns = "s", nsuri = "http://www.w3.org/2001/XMLSchema", 
                Rname = character(0), documentation = character(0)), 
            ALogP = new("PrimitiveSOAPType", fromConverter = function () 
            NULL, toConverter = .Primitive("as.double"), count = c(1, 
            1), abstract = logical(0), name = "double", ns = "s", 
                nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
                documentation = character(0)), XLogP = new("PrimitiveSOAPType", 
                fromConverter = function () 
                NULL, toConverter = .Primitive("as.double"), 
                count = c(1, 1), abstract = logical(0), name = "double", 
                ns = "s", nsuri = "http://www.w3.org/2001/XMLSchema", 
                Rname = character(0), documentation = character(0)), 
            CommonName = new("PrimitiveSOAPType", fromConverter = function () 
            NULL, toConverter = .Primitive("as.character"), count = c(0, 
            1), abstract = logical(0), name = "string", ns = "s", 
                nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
                documentation = character(0))), isAttribute = c(FALSE, 
        FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, 
        FALSE, FALSE, FALSE), uris = c("http://www.chemspider.com/", 
        "http://www.chemspider.com/", "http://www.chemspider.com/", 
        "http://www.chemspider.com/", "http://www.chemspider.com/", 
        "http://www.chemspider.com/", "http://www.chemspider.com/", 
        "http://www.chemspider.com/", "http://www.chemspider.com/", 
        "http://www.chemspider.com/", "http://www.chemspider.com/", 
        "http://www.chemspider.com/"), fromConverter = function () 
        NULL, toConverter = function () 
        NULL, count = numeric(0), abstract = logical(0), name = "ExtendedCompoundInfo", 
        ns = character(0), nsuri = "http://www.chemspider.com/", 
        Rname = character(0), documentation = character(0)), 
        name = "GetExtendedCompoundInfoResult", attributes = list(), 
        xmlAttrs = character(0), ns = character(0), nsuri = "http://www.chemspider.com/", 
        Rname = character(0), documentation = character(0)), 
    .opts = list(), nameSpaces = "1.2", .soapHeader = NULL) 
{
    .SOAP(server, "GetExtendedCompoundInfo", parameters = as(parameters, 
        "CSID.token"), action = "http://www.chemspider.com/GetExtendedCompoundInfo", 
        xmlns = "http://www.chemspider.com/", .types = list(parameters = new("Element", 
            type = new("ClassDefinition", slotTypes = list(CSID = new("PrimitiveSOAPType", 
                fromConverter = function () 
                NULL, toConverter = .Primitive("as.integer"), 
                count = c(1, 1), abstract = logical(0), name = "int", 
                ns = "s", nsuri = "http://www.w3.org/2001/XMLSchema", 
                Rname = character(0), documentation = character(0)), 
                token = new("PrimitiveSOAPType", fromConverter = function () 
                NULL, toConverter = .Primitive("as.character"), 
                  count = c(0, 1), abstract = logical(0), name = "string", 
                  ns = "s", nsuri = "http://www.w3.org/2001/XMLSchema", 
                  Rname = character(0), documentation = character(0))), 
                isAttribute = c(FALSE, FALSE), uris = c("http://www.chemspider.com/", 
                "http://www.chemspider.com/"), fromConverter = function () 
                NULL, toConverter = function () 
                NULL, count = numeric(0), abstract = logical(0), 
                name = "CSID.token", ns = character(0), nsuri = "http://www.chemspider.com/", 
                Rname = character(0), documentation = character(0)), 
            name = "GetExtendedCompoundInfo", attributes = list(), 
            xmlAttrs = character(0), ns = character(0), nsuri = "http://www.chemspider.com/", 
            Rname = character(0), documentation = character(0))), 
        .convert = .convert, .header = c(Accept = "text/xml", 
            Accept = "multipart/*", `Content-Type` = "text/xml; charset=utf-8", 
            SOAPAction = "\"http://www.chemspider.com/GetExtendedCompoundInfo\""), 
        .opts = .opts, .literal = TRUE, nameSpaces = nameSpaces, 
        .elementFormQualified = TRUE, .returnNodeName = "GetExtendedCompoundInfoResponse", 
        .soapHeader = .soapHeader)
}

class( GetExtendedCompoundInfo ) = c( 'SerializedFunction', 'WSDLGeneratedSOAPFunction' )

GetExtendedCompoundInfoArray = 
function (parameters = list(...), ..., server = new("HTTPSOAPServer", 
    host = "www.chemspider.com", port = NA_integer_, url = "/MassSpecAPI.asmx"), 
    .convert = new("LocalElement", count = c(0, 1), type = new("SimpleSequenceType", 
        elementType = character(0), elType = new("ClassDefinition", 
            slotTypes = list(CSID = new("PrimitiveSOAPType", 
                fromConverter = function () 
                NULL, toConverter = .Primitive("as.integer"), 
                count = c(1, 1), abstract = logical(0), name = "int", 
                ns = "s", nsuri = "http://www.w3.org/2001/XMLSchema", 
                Rname = character(0), documentation = character(0)), 
                MF = new("PrimitiveSOAPType", fromConverter = function () 
                NULL, toConverter = .Primitive("as.character"), 
                  count = c(0, 1), abstract = logical(0), name = "string", 
                  ns = "s", nsuri = "http://www.w3.org/2001/XMLSchema", 
                  Rname = character(0), documentation = character(0)), 
                SMILES = new("PrimitiveSOAPType", fromConverter = function () 
                NULL, toConverter = .Primitive("as.character"), 
                  count = c(0, 1), abstract = logical(0), name = "string", 
                  ns = "s", nsuri = "http://www.w3.org/2001/XMLSchema", 
                  Rname = character(0), documentation = character(0)), 
                InChI = new("PrimitiveSOAPType", fromConverter = function () 
                NULL, toConverter = .Primitive("as.character"), 
                  count = c(0, 1), abstract = logical(0), name = "string", 
                  ns = "s", nsuri = "http://www.w3.org/2001/XMLSchema", 
                  Rname = character(0), documentation = character(0)), 
                InChIKey = new("PrimitiveSOAPType", fromConverter = function () 
                NULL, toConverter = .Primitive("as.character"), 
                  count = c(0, 1), abstract = logical(0), name = "string", 
                  ns = "s", nsuri = "http://www.w3.org/2001/XMLSchema", 
                  Rname = character(0), documentation = character(0)), 
                AverageMass = new("PrimitiveSOAPType", fromConverter = function () 
                NULL, toConverter = .Primitive("as.double"), 
                  count = c(1, 1), abstract = logical(0), name = "double", 
                  ns = "s", nsuri = "http://www.w3.org/2001/XMLSchema", 
                  Rname = character(0), documentation = character(0)), 
                MolecularWeight = new("PrimitiveSOAPType", fromConverter = function () 
                NULL, toConverter = .Primitive("as.double"), 
                  count = c(1, 1), abstract = logical(0), name = "double", 
                  ns = "s", nsuri = "http://www.w3.org/2001/XMLSchema", 
                  Rname = character(0), documentation = character(0)), 
                MonoisotopicMass = new("PrimitiveSOAPType", fromConverter = function () 
                NULL, toConverter = .Primitive("as.double"), 
                  count = c(1, 1), abstract = logical(0), name = "double", 
                  ns = "s", nsuri = "http://www.w3.org/2001/XMLSchema", 
                  Rname = character(0), documentation = character(0)), 
                NominalMass = new("PrimitiveSOAPType", fromConverter = function () 
                NULL, toConverter = .Primitive("as.double"), 
                  count = c(1, 1), abstract = logical(0), name = "double", 
                  ns = "s", nsuri = "http://www.w3.org/2001/XMLSchema", 
                  Rname = character(0), documentation = character(0)), 
                ALogP = new("PrimitiveSOAPType", fromConverter = function () 
                NULL, toConverter = .Primitive("as.double"), 
                  count = c(1, 1), abstract = logical(0), name = "double", 
                  ns = "s", nsuri = "http://www.w3.org/2001/XMLSchema", 
                  Rname = character(0), documentation = character(0)), 
                XLogP = new("PrimitiveSOAPType", fromConverter = function () 
                NULL, toConverter = .Primitive("as.double"), 
                  count = c(1, 1), abstract = logical(0), name = "double", 
                  ns = "s", nsuri = "http://www.w3.org/2001/XMLSchema", 
                  Rname = character(0), documentation = character(0)), 
                CommonName = new("PrimitiveSOAPType", fromConverter = function () 
                NULL, toConverter = .Primitive("as.character"), 
                  count = c(0, 1), abstract = logical(0), name = "string", 
                  ns = "s", nsuri = "http://www.w3.org/2001/XMLSchema", 
                  Rname = character(0), documentation = character(0))), 
            isAttribute = c(FALSE, FALSE, FALSE, FALSE, FALSE, 
            FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE), 
            uris = c("http://www.chemspider.com/", "http://www.chemspider.com/", 
            "http://www.chemspider.com/", "http://www.chemspider.com/", 
            "http://www.chemspider.com/", "http://www.chemspider.com/", 
            "http://www.chemspider.com/", "http://www.chemspider.com/", 
            "http://www.chemspider.com/", "http://www.chemspider.com/", 
            "http://www.chemspider.com/", "http://www.chemspider.com/"
            ), fromConverter = function () 
            NULL, toConverter = function () 
            NULL, count = numeric(0), abstract = logical(0), 
            name = "ExtendedCompoundInfo", ns = character(0), 
            nsuri = "http://www.chemspider.com/", Rname = character(0), 
            documentation = character(0)), fromConverter = function () 
        NULL, toConverter = function () 
        NULL, count = c(0, Inf), abstract = logical(0), name = "ArrayOfExtendedCompoundInfo", 
        ns = character(0), nsuri = "http://www.chemspider.com/", 
        Rname = character(0), documentation = character(0)), 
        name = "GetExtendedCompoundInfoArrayResult", attributes = list(), 
        xmlAttrs = character(0), ns = character(0), nsuri = "http://www.chemspider.com/", 
        Rname = character(0), documentation = character(0)), 
    .opts = list(), nameSpaces = "1.2", .soapHeader = NULL) 
{
    .SOAP(server, "GetExtendedCompoundInfoArray", parameters = as(parameters, 
        "CSIDs.token"), action = "http://www.chemspider.com/GetExtendedCompoundInfoArray", 
        xmlns = "http://www.chemspider.com/", .types = list(parameters = new("Element", 
            type = new("ClassDefinition", slotTypes = list(CSIDs = new("SimpleSequenceType", 
                elementType = character(0), elType = new("PrimitiveSOAPType", 
                  fromConverter = function () 
                  NULL, toConverter = .Primitive("as.integer"), 
                  count = c(0, Inf), abstract = logical(0), name = "int", 
                  ns = "s", nsuri = "http://www.w3.org/2001/XMLSchema", 
                  Rname = character(0), documentation = character(0)), 
                fromConverter = function () 
                NULL, toConverter = function () 
                NULL, count = c(0, Inf), abstract = logical(0), 
                name = "ArrayOfInt", ns = character(0), nsuri = "http://www.chemspider.com/", 
                Rname = character(0), documentation = character(0)), 
                token = new("PrimitiveSOAPType", fromConverter = function () 
                NULL, toConverter = .Primitive("as.character"), 
                  count = c(0, 1), abstract = logical(0), name = "string", 
                  ns = "s", nsuri = "http://www.w3.org/2001/XMLSchema", 
                  Rname = character(0), documentation = character(0))), 
                isAttribute = c(FALSE, FALSE), uris = c("http://www.chemspider.com/", 
                "http://www.chemspider.com/"), fromConverter = function () 
                NULL, toConverter = function () 
                NULL, count = numeric(0), abstract = logical(0), 
                name = "CSIDs.token", ns = character(0), nsuri = "http://www.chemspider.com/", 
                Rname = character(0), documentation = character(0)), 
            name = "GetExtendedCompoundInfoArray", attributes = list(), 
            xmlAttrs = character(0), ns = character(0), nsuri = "http://www.chemspider.com/", 
            Rname = character(0), documentation = character(0))), 
        .convert = .convert, .header = c(Accept = "text/xml", 
            Accept = "multipart/*", `Content-Type` = "text/xml; charset=utf-8", 
            SOAPAction = "\"http://www.chemspider.com/GetExtendedCompoundInfoArray\""), 
        .opts = .opts, .literal = TRUE, nameSpaces = nameSpaces, 
        .elementFormQualified = TRUE, .returnNodeName = "GetExtendedCompoundInfoArrayResponse", 
        .soapHeader = .soapHeader)
}

class( GetExtendedCompoundInfoArray ) = c( 'SerializedFunction', 'WSDLGeneratedSOAPFunction' )

SearchByMassAsync = 
function (parameters = list(...), ..., server = new("HTTPSOAPServer", 
    host = "www.chemspider.com", port = NA_integer_, url = "/MassSpecAPI.asmx"), 
    .convert = new("LocalElement", count = c(0, 1), type = new("PrimitiveSOAPType", 
        fromConverter = function () 
        NULL, toConverter = .Primitive("as.character"), count = c(0, 
        1), abstract = logical(0), name = "string", ns = "s", 
        nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
        documentation = character(0)), name = "SearchByMassAsyncResult", 
        attributes = list(), xmlAttrs = character(0), ns = character(0), 
        nsuri = "http://www.chemspider.com/", Rname = character(0), 
        documentation = character(0)), .opts = list(), nameSpaces = "1.2", 
    .soapHeader = NULL) 
{
    .SOAP(server, "SearchByMassAsync", parameters = as(parameters, 
        "mass.range.dbs.token"), action = "http://www.chemspider.com/SearchByMassAsync", 
        xmlns = "http://www.chemspider.com/", .types = list(parameters = new("Element", 
            type = new("ClassDefinition", slotTypes = list(mass = new("PrimitiveSOAPType", 
                fromConverter = function () 
                NULL, toConverter = .Primitive("as.double"), 
                count = c(1, 1), abstract = logical(0), name = "double", 
                ns = "s", nsuri = "http://www.w3.org/2001/XMLSchema", 
                Rname = character(0), documentation = character(0)), 
                range = new("PrimitiveSOAPType", fromConverter = function () 
                NULL, toConverter = .Primitive("as.double"), 
                  count = c(1, 1), abstract = logical(0), name = "double", 
                  ns = "s", nsuri = "http://www.w3.org/2001/XMLSchema", 
                  Rname = character(0), documentation = character(0)), 
                dbs = new("SimpleSequenceType", elementType = character(0), 
                  elType = new("PrimitiveSOAPType", fromConverter = function () 
                  NULL, toConverter = .Primitive("as.character"), 
                    count = c(0, Inf), abstract = logical(0), 
                    name = "string", ns = "s", nsuri = "http://www.w3.org/2001/XMLSchema", 
                    Rname = character(0), documentation = character(0)), 
                  fromConverter = function () 
                  NULL, toConverter = function () 
                  NULL, count = c(0, Inf), abstract = logical(0), 
                  name = "ArrayOfString", ns = character(0), 
                  nsuri = "http://www.chemspider.com/", Rname = character(0), 
                  documentation = character(0)), token = new("PrimitiveSOAPType", 
                  fromConverter = function () 
                  NULL, toConverter = .Primitive("as.character"), 
                  count = c(0, 1), abstract = logical(0), name = "string", 
                  ns = "s", nsuri = "http://www.w3.org/2001/XMLSchema", 
                  Rname = character(0), documentation = character(0))), 
                isAttribute = c(FALSE, FALSE, FALSE, FALSE), 
                uris = c("http://www.chemspider.com/", "http://www.chemspider.com/", 
                "http://www.chemspider.com/", "http://www.chemspider.com/"
                ), fromConverter = function () 
                NULL, toConverter = function () 
                NULL, count = numeric(0), abstract = logical(0), 
                name = "mass.range.dbs.token", ns = character(0), 
                nsuri = "http://www.chemspider.com/", Rname = character(0), 
                documentation = character(0)), name = "SearchByMassAsync", 
            attributes = list(), xmlAttrs = character(0), ns = character(0), 
            nsuri = "http://www.chemspider.com/", Rname = character(0), 
            documentation = character(0))), .convert = .convert, 
        .header = c(Accept = "text/xml", Accept = "multipart/*", 
            `Content-Type` = "text/xml; charset=utf-8", SOAPAction = "\"http://www.chemspider.com/SearchByMassAsync\""), 
        .opts = .opts, .literal = TRUE, nameSpaces = nameSpaces, 
        .elementFormQualified = TRUE, .returnNodeName = "SearchByMassAsyncResponse", 
        .soapHeader = .soapHeader)
}

class( SearchByMassAsync ) = c( 'SerializedFunction', 'WSDLGeneratedSOAPFunction' )

SearchByFormulaAsync = 
function (parameters = list(...), ..., server = new("HTTPSOAPServer", 
    host = "www.chemspider.com", port = NA_integer_, url = "/MassSpecAPI.asmx"), 
    .convert = new("LocalElement", count = c(0, 1), type = new("PrimitiveSOAPType", 
        fromConverter = function () 
        NULL, toConverter = .Primitive("as.character"), count = c(0, 
        1), abstract = logical(0), name = "string", ns = "s", 
        nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
        documentation = character(0)), name = "SearchByFormulaAsyncResult", 
        attributes = list(), xmlAttrs = character(0), ns = character(0), 
        nsuri = "http://www.chemspider.com/", Rname = character(0), 
        documentation = character(0)), .opts = list(), nameSpaces = "1.2", 
    .soapHeader = NULL) 
{
    .SOAP(server, "SearchByFormulaAsync", parameters = as(parameters, 
        "formula.dbs.token"), action = "http://www.chemspider.com/SearchByFormulaAsync", 
        xmlns = "http://www.chemspider.com/", .types = list(parameters = new("Element", 
            type = new("ClassDefinition", slotTypes = list(formula = new("PrimitiveSOAPType", 
                fromConverter = function () 
                NULL, toConverter = .Primitive("as.character"), 
                count = c(0, 1), abstract = logical(0), name = "string", 
                ns = "s", nsuri = "http://www.w3.org/2001/XMLSchema", 
                Rname = character(0), documentation = character(0)), 
                dbs = new("SimpleSequenceType", elementType = character(0), 
                  elType = new("PrimitiveSOAPType", fromConverter = function () 
                  NULL, toConverter = .Primitive("as.character"), 
                    count = c(0, Inf), abstract = logical(0), 
                    name = "string", ns = "s", nsuri = "http://www.w3.org/2001/XMLSchema", 
                    Rname = character(0), documentation = character(0)), 
                  fromConverter = function () 
                  NULL, toConverter = function () 
                  NULL, count = c(0, Inf), abstract = logical(0), 
                  name = "ArrayOfString", ns = character(0), 
                  nsuri = "http://www.chemspider.com/", Rname = character(0), 
                  documentation = character(0)), token = new("PrimitiveSOAPType", 
                  fromConverter = function () 
                  NULL, toConverter = .Primitive("as.character"), 
                  count = c(0, 1), abstract = logical(0), name = "string", 
                  ns = "s", nsuri = "http://www.w3.org/2001/XMLSchema", 
                  Rname = character(0), documentation = character(0))), 
                isAttribute = c(FALSE, FALSE, FALSE), uris = c("http://www.chemspider.com/", 
                "http://www.chemspider.com/", "http://www.chemspider.com/"
                ), fromConverter = function () 
                NULL, toConverter = function () 
                NULL, count = numeric(0), abstract = logical(0), 
                name = "formula.dbs.token", ns = character(0), 
                nsuri = "http://www.chemspider.com/", Rname = character(0), 
                documentation = character(0)), name = "SearchByFormulaAsync", 
            attributes = list(), xmlAttrs = character(0), ns = character(0), 
            nsuri = "http://www.chemspider.com/", Rname = character(0), 
            documentation = character(0))), .convert = .convert, 
        .header = c(Accept = "text/xml", Accept = "multipart/*", 
            `Content-Type` = "text/xml; charset=utf-8", SOAPAction = "\"http://www.chemspider.com/SearchByFormulaAsync\""), 
        .opts = .opts, .literal = TRUE, nameSpaces = nameSpaces, 
        .elementFormQualified = TRUE, .returnNodeName = "SearchByFormulaAsyncResponse", 
        .soapHeader = .soapHeader)
}

class( SearchByFormulaAsync ) = c( 'SerializedFunction', 'WSDLGeneratedSOAPFunction' )

