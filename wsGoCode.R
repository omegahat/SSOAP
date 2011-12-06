library(SSOAP)
library(XML)
setClass( 'ArrayOfDepositor' ,
	   representation(
		.Data = 'list') ,
	   contains = c( 'list' )
 ) 
setAs('XMLInternalElementNode', 'ArrayOfDepositor',


function (from, to = "ArrayOfDepositor", strict = TRUE) 
xmlSApply(from, as, "Depositor")


)
setClass( 'ArrayOfDepositor' ,
	   representation(
		.Data = 'list') ,
	   contains = c( 'list' )
 ) 
setAs('XMLInternalElementNode', 'ArrayOfDepositor',


function (from, to = "ArrayOfDepositor", strict = TRUE) 
xmlSApply(from, as, "Depositor")


)
setClass( 'Depositor' ,
	   representation(
		Name = 'character',
		ID = 'integer') ,
	   contains = c( 'VirtualSOAPClass' )
 ) 
setClass( 'ArrayOfProperty' ,
	   representation(
		.Data = 'list') ,
	   contains = c( 'list' )
 ) 
setAs('XMLInternalElementNode', 'ArrayOfProperty',


function (from, to = "ArrayOfProperty", strict = TRUE) 
xmlSApply(from, as, "Property")


)
setClass( 'ArrayOfProperty' ,
	   representation(
		.Data = 'list') ,
	   contains = c( 'list' )
 ) 
setAs('XMLInternalElementNode', 'ArrayOfProperty',


function (from, to = "ArrayOfProperty", strict = TRUE) 
xmlSApply(from, as, "Property")


)
setClass( 'Property' ,
	   representation(
		Name = 'character',
		URL = 'character',
		ID = 'integer') ,
	   contains = c( 'VirtualSOAPClass' )
 ) 
setClass( 'ArrayOfAdduct' ,
	   representation(
		.Data = 'list') ,
	   contains = c( 'list' )
 ) 
setAs('XMLInternalElementNode', 'ArrayOfAdduct',


function (from, to = "ArrayOfAdduct", strict = TRUE) 
xmlSApply(from, as, "Adduct")


)
setClass( 'ArrayOfAdduct' ,
	   representation(
		.Data = 'list') ,
	   contains = c( 'list' )
 ) 
setAs('XMLInternalElementNode', 'ArrayOfAdduct',


function (from, to = "ArrayOfAdduct", strict = TRUE) 
xmlSApply(from, as, "Adduct")


)
setClass( 'Adduct' ,
	   representation(
		Name = 'character',
		Code = 'character',
		MonomerCharge = 'numeric',
		Correction = 'numeric',
		ID = 'integer') ,
	   contains = c( 'VirtualSOAPClass' )
 ) 
setClass( 'DepositorIds.AdductIds' ,
	   representation(
		DepositorIds = 'ArrayOfShort',
		AdductIds = 'Base64Encoded') ,
	   contains = c( 'VirtualSOAPClass' )
 ) 
setClass( 'ArrayOfShort' ,
	   representation(
		.Data = 'integer') ,
	   contains = c( 'integer' )
 ) 
setAs('XMLInternalElementNode', 'ArrayOfShort',


function (from, to = "ArrayOfShort", strict = TRUE) 
xmlSApply(from, as, "integer")


)
setAs('character', 'ArrayOfShort',


function (from, to = "ArrayOfShort", strict = TRUE) 
new("ArrayOfShort", as(from, "character"))


)
setAs('integer', 'ArrayOfShort',


function (from, to = "ArrayOfShort", strict = TRUE) 
new("ArrayOfShort", as(from, "numeric"))


)
setAs('numeric', 'ArrayOfShort',


function (from, to = "ArrayOfShort", strict = TRUE) 
new("ArrayOfShort", as(from, "numeric"))


)
setAs('logical', 'ArrayOfShort',


function (from, to = "ArrayOfShort", strict = TRUE) 
new("ArrayOfShort", as(from, "logical"))


)
setClass( 'guid' ,
	   representation(
		.Data = 'character') ,
	   contains = c( 'character' )
 ) 
setAs('XMLAbstractNode', 'guid',


function (from, to = "guid", strict = TRUE) 
{
    if (is(from, "XMLAbstractNode")) 
        from = xmlValue(from)
    as(from, "character")
}


)
setAs('XMLInternalElementNode', 'guid',


function (from, to = "guid", strict = TRUE) 
{
    if (is(from, "XMLAbstractNode")) 
        from = xmlValue(from)
    as(from, "character")
}


)
setClass( 'guid' ,
	   representation(
		.Data = 'character') ,
	   contains = c( 'character' )
 ) 
setAs('XMLAbstractNode', 'guid',


function (from, to = "guid", strict = TRUE) 
{
    if (is(from, "XMLAbstractNode")) 
        from = xmlValue(from)
    as(from, "character")
}


)
setAs('XMLInternalElementNode', 'guid',


function (from, to = "guid", strict = TRUE) 
{
    if (is(from, "XMLAbstractNode")) 
        from = xmlValue(from)
    as(from, "character")
}


)
setClass( 'SessionID.mass.tolerance' ,
	   representation(
		SessionID = 'guid',
		mass = 'numeric',
		tolerance = 'numeric') ,
	   contains = c( 'VirtualSOAPClass' )
 ) 
setClass( 'ArrayOfMassSearchHit' ,
	   representation(
		.Data = 'list') ,
	   contains = c( 'list' )
 ) 
setAs('XMLInternalElementNode', 'ArrayOfMassSearchHit',


function (from, to = "ArrayOfMassSearchHit", strict = TRUE) 
xmlSApply(from, as, "MassSearchHit")


)
setClass( 'ArrayOfMassSearchHit' ,
	   representation(
		.Data = 'list') ,
	   contains = c( 'list' )
 ) 
setAs('XMLInternalElementNode', 'ArrayOfMassSearchHit',


function (from, to = "ArrayOfMassSearchHit", strict = TRUE) 
xmlSApply(from, as, "MassSearchHit")


)
setClass( 'MassSearchHit' ,
	   representation(
		fID = 'integer',
		formula = 'character',
		adduct = 'integer',
		monoisotopic_mass = 'numeric',
		diff = 'numeric',
		mass_ppm_error = 'numeric') ,
	   contains = c( 'AdductHit' )
 ) 
setClass( 'AdductHit' ,
	   representation(
		adduct = 'integer',
		monoisotopic_mass = 'numeric',
		diff = 'numeric',
		mass_ppm_error = 'numeric') ,
	   contains = c( 'VirtualSOAPClass' )
 ) 
setClass( 'SessionID.mass.tolerance' ,
	   representation(
		SessionID = 'guid',
		mass = 'numeric',
		tolerance = 'numeric') ,
	   contains = c( 'VirtualSOAPClass' )
 ) 
setClass( 'ArrayOfMassSearchHit' ,
	   representation(
		.Data = 'list') ,
	   contains = c( 'list' )
 ) 
setAs('XMLInternalElementNode', 'ArrayOfMassSearchHit',


function (from, to = "ArrayOfMassSearchHit", strict = TRUE) 
xmlSApply(from, as, "MassSearchHit")


)
setClass( 'SessionID.mass.tolerance' ,
	   representation(
		SessionID = 'guid',
		mass = 'numeric',
		tolerance = 'numeric') ,
	   contains = c( 'VirtualSOAPClass' )
 ) 
setClass( 'ArrayOfMassSearchHit' ,
	   representation(
		.Data = 'list') ,
	   contains = c( 'list' )
 ) 
setAs('XMLInternalElementNode', 'ArrayOfMassSearchHit',


function (from, to = "ArrayOfMassSearchHit", strict = TRUE) 
xmlSApply(from, as, "MassSearchHit")


)
setClass( 'SessionID.mass.tolerance' ,
	   representation(
		SessionID = 'guid',
		mass = 'numeric',
		tolerance = 'numeric') ,
	   contains = c( 'VirtualSOAPClass' )
 ) 
setClass( 'ArrayOfMassSearchHit' ,
	   representation(
		.Data = 'list') ,
	   contains = c( 'list' )
 ) 
setAs('XMLInternalElementNode', 'ArrayOfMassSearchHit',


function (from, to = "ArrayOfMassSearchHit", strict = TRUE) 
xmlSApply(from, as, "MassSearchHit")


)
setClass( 'SessionID.FormulaID' ,
	   representation(
		SessionID = 'guid',
		FormulaID = 'integer') ,
	   contains = c( 'VirtualSOAPClass' )
 ) 
setClass( 'ArrayOfSynonym' ,
	   representation(
		.Data = 'list') ,
	   contains = c( 'list' )
 ) 
setAs('XMLInternalElementNode', 'ArrayOfSynonym',


function (from, to = "ArrayOfSynonym", strict = TRUE) 
xmlSApply(from, as, "Synonym")


)
setClass( 'ArrayOfSynonym' ,
	   representation(
		.Data = 'list') ,
	   contains = c( 'list' )
 ) 
setAs('XMLInternalElementNode', 'ArrayOfSynonym',


function (from, to = "ArrayOfSynonym", strict = TRUE) 
xmlSApply(from, as, "Synonym")


)
setClass( 'ArrayOfDepositor' ,
	   representation(
		.Data = 'list') ,
	   contains = c( 'list' )
 ) 
setAs('XMLInternalElementNode', 'ArrayOfDepositor',


function (from, to = "ArrayOfDepositor", strict = TRUE) 
xmlSApply(from, as, "Depositor")


)
setClass( 'ArrayOfProperty' ,
	   representation(
		.Data = 'list') ,
	   contains = c( 'list' )
 ) 
setAs('XMLInternalElementNode', 'ArrayOfProperty',


function (from, to = "ArrayOfProperty", strict = TRUE) 
xmlSApply(from, as, "Property")


)
setClass( 'ArrayOfAdduct' ,
	   representation(
		.Data = 'list') ,
	   contains = c( 'list' )
 ) 
setAs('XMLInternalElementNode', 'ArrayOfAdduct',


function (from, to = "ArrayOfAdduct", strict = TRUE) 
xmlSApply(from, as, "Adduct")


)
setClass( 'guid' ,
	   representation(
		.Data = 'character') ,
	   contains = c( 'character' )
 ) 
setAs('XMLAbstractNode', 'guid',


function (from, to = "guid", strict = TRUE) 
{
    if (is(from, "XMLAbstractNode")) 
        from = xmlValue(from)
    as(from, "character")
}


)
setAs('XMLInternalElementNode', 'guid',


function (from, to = "guid", strict = TRUE) 
{
    if (is(from, "XMLAbstractNode")) 
        from = xmlValue(from)
    as(from, "character")
}


)
setClass( 'guid' ,
	   representation(
		.Data = 'character') ,
	   contains = c( 'character' )
 ) 
setAs('XMLAbstractNode', 'guid',


function (from, to = "guid", strict = TRUE) 
{
    if (is(from, "XMLAbstractNode")) 
        from = xmlValue(from)
    as(from, "character")
}


)
setAs('XMLInternalElementNode', 'guid',


function (from, to = "guid", strict = TRUE) 
{
    if (is(from, "XMLAbstractNode")) 
        from = xmlValue(from)
    as(from, "character")
}


)
setClass( 'Synonym' ,
	   representation(
		value = 'character',
		ID = 'integer',
		FormulaID = 'integer',
		PropertyID = 'integer',
		DepositorID = 'integer',
		DepositorsPrimaryKey = 'character') ,
	   contains = c( 'VirtualSOAPClass' )
 ) 
setClass( 'StringArray' ,
	   representation(
		.Data = 'character') ,
	   contains = c( 'character' )
 ) 
setAs('XMLInternalElementNode', 'StringArray',


function (from, to = "StringArray", strict = TRUE) 
xmlSApply(from, as, "character")


)
setAs('integer', 'StringArray',


function (from, to = "StringArray", strict = TRUE) 
new("StringArray", as(from, "integer"))


)
setAs('numeric', 'StringArray',


function (from, to = "StringArray", strict = TRUE) 
new("StringArray", as(from, "numeric"))


)
setAs('logical', 'StringArray',


function (from, to = "StringArray", strict = TRUE) 
new("StringArray", as(from, "logical"))


)
GetDepositors = 
function (server = new("HTTPSOAPServer", host = "gmd.mpimp-golm.mpg.de", 
    port = NA_integer_, url = "/webservices/wsGoBioSpace.asmx"), 
    .convert = new("LocalElement", count = c(0, 1), type = new("SimpleSequenceType", 
        elementType = character(0), elType = new("ClassDefinition", 
            slotTypes = list(Name = new("PrimitiveSOAPType", 
                fromConverter = function () 
                NULL, toConverter = .Primitive("as.character"), 
                count = c(0, 1), abstract = logical(0), name = "string", 
                ns = "s", nsuri = "http://www.w3.org/2001/XMLSchema", 
                Rname = character(0), documentation = character(0)), 
                ID = new("PrimitiveSOAPType", fromConverter = function () 
                NULL, toConverter = .Primitive("as.integer"), 
                  count = numeric(0), abstract = logical(0), 
                  name = "short", ns = "s", nsuri = "http://www.w3.org/2001/XMLSchema", 
                  Rname = character(0), documentation = character(0))), 
            isAttribute = c(FALSE, TRUE), uris = character(0), 
            fromConverter = function () 
            NULL, toConverter = function () 
            NULL, count = numeric(0), abstract = logical(0), 
            name = "Depositor", ns = character(0), nsuri = character(0), 
            Rname = character(0), documentation = character(0)), 
        fromConverter = function () 
        NULL, toConverter = function () 
        NULL, count = c(0, Inf), abstract = logical(0), name = "ArrayOfDepositor", 
        ns = character(0), nsuri = "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/", 
        Rname = character(0), documentation = character(0)), 
        name = "GetDepositorsResult", attributes = list(), xmlAttrs = character(0), 
        ns = character(0), nsuri = "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/", 
        Rname = character(0), documentation = character(0)), 
    .opts = list(), nameSpaces = "1.2", .soapHeader = NULL) 
{
    .SOAP(server, "GetDepositors", action = "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/GetDepositors", 
        xmlns = "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/", 
        .types = list(), .convert = .convert, .header = c(Accept = "text/xml", 
            Accept = "multipart/*", `Content-Type` = "text/xml; charset=utf-8", 
            SOAPAction = "\"http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/GetDepositors\""), 
        .opts = .opts, .literal = TRUE, nameSpaces = nameSpaces, 
        .elementFormQualified = TRUE, .returnNodeName = "GetDepositorsResponse", 
        .soapHeader = .soapHeader)
}

class( GetDepositors ) = c( 'SerializedFunction', 'WSDLGeneratedSOAPFunction' )

GetProperties = 
function (server = new("HTTPSOAPServer", host = "gmd.mpimp-golm.mpg.de", 
    port = NA_integer_, url = "/webservices/wsGoBioSpace.asmx"), 
    .convert = new("LocalElement", count = c(0, 1), type = new("SimpleSequenceType", 
        elementType = character(0), elType = new("ClassDefinition", 
            slotTypes = list(Name = new("PrimitiveSOAPType", 
                fromConverter = function () 
                NULL, toConverter = .Primitive("as.character"), 
                count = c(0, 1), abstract = logical(0), name = "string", 
                ns = "s", nsuri = "http://www.w3.org/2001/XMLSchema", 
                Rname = character(0), documentation = character(0)), 
                URL = new("PrimitiveSOAPType", fromConverter = function () 
                NULL, toConverter = .Primitive("as.character"), 
                  count = c(0, 1), abstract = logical(0), name = "string", 
                  ns = "s", nsuri = "http://www.w3.org/2001/XMLSchema", 
                  Rname = character(0), documentation = character(0)), 
                ID = new("PrimitiveSOAPType", fromConverter = function () 
                NULL, toConverter = .Primitive("as.integer"), 
                  count = numeric(0), abstract = logical(0), 
                  name = "unsignedByte", ns = "s", nsuri = "http://www.w3.org/2001/XMLSchema", 
                  Rname = character(0), documentation = character(0))), 
            isAttribute = c(FALSE, FALSE, TRUE), uris = c("http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/", 
            "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/"), 
            fromConverter = function () 
            NULL, toConverter = function () 
            NULL, count = numeric(0), abstract = logical(0), 
            name = "Property", ns = character(0), nsuri = "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/", 
            Rname = character(0), documentation = character(0)), 
        fromConverter = function () 
        NULL, toConverter = function () 
        NULL, count = c(0, Inf), abstract = logical(0), name = "ArrayOfProperty", 
        ns = character(0), nsuri = "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/", 
        Rname = character(0), documentation = character(0)), 
        name = "GetPropertiesResult", attributes = list(), xmlAttrs = character(0), 
        ns = character(0), nsuri = "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/", 
        Rname = character(0), documentation = character(0)), 
    .opts = list(), nameSpaces = "1.2", .soapHeader = NULL) 
{
    .SOAP(server, "GetProperties", action = "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/GetProperties", 
        xmlns = "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/", 
        .types = list(), .convert = .convert, .header = c(Accept = "text/xml", 
            Accept = "multipart/*", `Content-Type` = "text/xml; charset=utf-8", 
            SOAPAction = "\"http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/GetProperties\""), 
        .opts = .opts, .literal = TRUE, nameSpaces = nameSpaces, 
        .elementFormQualified = TRUE, .returnNodeName = "GetPropertiesResponse", 
        .soapHeader = .soapHeader)
}

class( GetProperties ) = c( 'SerializedFunction', 'WSDLGeneratedSOAPFunction' )

GetAdducts = 
function (server = new("HTTPSOAPServer", host = "gmd.mpimp-golm.mpg.de", 
    port = NA_integer_, url = "/webservices/wsGoBioSpace.asmx"), 
    .convert = new("LocalElement", count = c(0, 1), type = new("SimpleSequenceType", 
        elementType = character(0), elType = new("ClassDefinition", 
            slotTypes = list(Name = new("PrimitiveSOAPType", 
                fromConverter = function () 
                NULL, toConverter = .Primitive("as.character"), 
                count = c(0, 1), abstract = logical(0), name = "string", 
                ns = "s", nsuri = "http://www.w3.org/2001/XMLSchema", 
                Rname = character(0), documentation = character(0)), 
                Code = new("PrimitiveSOAPType", fromConverter = function () 
                NULL, toConverter = .Primitive("as.character"), 
                  count = c(0, 1), abstract = logical(0), name = "string", 
                  ns = "s", nsuri = "http://www.w3.org/2001/XMLSchema", 
                  Rname = character(0), documentation = character(0)), 
                MonomerCharge = new("PrimitiveSOAPType", fromConverter = function () 
                NULL, toConverter = .Primitive("as.double"), 
                  count = c(1, 1), abstract = logical(0), name = "float", 
                  ns = "s", nsuri = "http://www.w3.org/2001/XMLSchema", 
                  Rname = character(0), documentation = character(0)), 
                Correction = new("PrimitiveSOAPType", fromConverter = function () 
                NULL, toConverter = .Primitive("as.double"), 
                  count = c(1, 1), abstract = logical(0), name = "float", 
                  ns = "s", nsuri = "http://www.w3.org/2001/XMLSchema", 
                  Rname = character(0), documentation = character(0)), 
                ID = new("PrimitiveSOAPType", fromConverter = function () 
                NULL, toConverter = .Primitive("as.integer"), 
                  count = numeric(0), abstract = logical(0), 
                  name = "unsignedByte", ns = "s", nsuri = "http://www.w3.org/2001/XMLSchema", 
                  Rname = character(0), documentation = character(0))), 
            isAttribute = c(FALSE, FALSE, FALSE, FALSE, TRUE), 
            uris = c("http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/", 
            "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/", "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/", 
            "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/"), 
            fromConverter = function () 
            NULL, toConverter = function () 
            NULL, count = numeric(0), abstract = logical(0), 
            name = "Adduct", ns = character(0), nsuri = "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/", 
            Rname = character(0), documentation = character(0)), 
        fromConverter = function () 
        NULL, toConverter = function () 
        NULL, count = c(0, Inf), abstract = logical(0), name = "ArrayOfAdduct", 
        ns = character(0), nsuri = "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/", 
        Rname = character(0), documentation = character(0)), 
        name = "GetAdductsResult", attributes = list(), xmlAttrs = character(0), 
        ns = character(0), nsuri = "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/", 
        Rname = character(0), documentation = character(0)), 
    .opts = list(), nameSpaces = "1.2", .soapHeader = NULL) 
{
    .SOAP(server, "GetAdducts", action = "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/GetAdducts", 
        xmlns = "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/", 
        .types = list(), .convert = .convert, .header = c(Accept = "text/xml", 
            Accept = "multipart/*", `Content-Type` = "text/xml; charset=utf-8", 
            SOAPAction = "\"http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/GetAdducts\""), 
        .opts = .opts, .literal = TRUE, nameSpaces = nameSpaces, 
        .elementFormQualified = TRUE, .returnNodeName = "GetAdductsResponse", 
        .soapHeader = .soapHeader)
}

class( GetAdducts ) = c( 'SerializedFunction', 'WSDLGeneratedSOAPFunction' )

CreateSession = 
function (parameters = list(...), ..., server = new("HTTPSOAPServer", 
    host = "gmd.mpimp-golm.mpg.de", port = NA_integer_, url = "/webservices/wsGoBioSpace.asmx"), 
    .convert = new("LocalElement", count = c(1, 1), type = new("RestrictedStringPatternDefinition", 
        pattern = "[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}", 
        fromConverter = function (from) 
        {
            if (is(from, "XMLAbstractNode")) 
                from = xmlValue(from)
            as(from, "character")
        }, toConverter = function (from, epattern = "^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$") 
        {
            x = as(from, "character")
            if (length(grep(epattern, x)) == 0) 
                stop("Invalid string: doesn't match expected pattern")
            x
        }, count = numeric(0), abstract = logical(0), name = "guid", 
        ns = "xsd", nsuri = "http://www.w3.org/2001/XMLSchema", 
        Rname = character(0), documentation = character(0)), 
        name = "CreateSessionResult", attributes = list(), xmlAttrs = character(0), 
        ns = character(0), nsuri = "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/", 
        Rname = character(0), documentation = character(0)), 
    .opts = list(), nameSpaces = "1.2", .soapHeader = NULL) 
{
    .SOAP(server, "CreateSession", parameters = as(parameters, 
        "DepositorIds.AdductIds"), action = "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/CreateSession", 
        xmlns = "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/", 
        .types = list(parameters = new("Element", type = new("ClassDefinition", 
            slotTypes = list(DepositorIds = new("SimpleSequenceType", 
                elementType = character(0), elType = new("PrimitiveSOAPType", 
                  fromConverter = function () 
                  NULL, toConverter = .Primitive("as.integer"), 
                  count = c(0, Inf), abstract = logical(0), name = "short", 
                  ns = "s", nsuri = "http://www.w3.org/2001/XMLSchema", 
                  Rname = character(0), documentation = character(0)), 
                fromConverter = function () 
                NULL, toConverter = function () 
                NULL, count = c(0, Inf), abstract = logical(0), 
                name = "ArrayOfShort", ns = character(0), nsuri = "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/", 
                Rname = character(0), documentation = character(0)), 
                AdductIds = new("PrimitiveSOAPType", fromConverter = function (x) 
                new("Base64Encoded", xmlValue(x)), toConverter = function () 
                NULL, count = c(0, 1), abstract = logical(0), 
                  name = "base64Binary", ns = "s", nsuri = "http://www.w3.org/2001/XMLSchema", 
                  Rname = character(0), documentation = character(0))), 
            isAttribute = c(FALSE, FALSE), uris = c("http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/", 
            "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/"), 
            fromConverter = function () 
            NULL, toConverter = function () 
            NULL, count = numeric(0), abstract = logical(0), 
            name = "DepositorIds.AdductIds", ns = character(0), 
            nsuri = "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/", 
            Rname = character(0), documentation = character(0)), 
            name = "CreateSession", attributes = list(), xmlAttrs = character(0), 
            ns = character(0), nsuri = "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/", 
            Rname = character(0), documentation = character(0))), 
        .convert = .convert, .header = c(Accept = "text/xml", 
            Accept = "multipart/*", `Content-Type` = "text/xml; charset=utf-8", 
            SOAPAction = "\"http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/CreateSession\""), 
        .opts = .opts, .literal = TRUE, nameSpaces = nameSpaces, 
        .elementFormQualified = TRUE, .returnNodeName = "CreateSessionResponse", 
        .soapHeader = .soapHeader)
}

class( CreateSession ) = c( 'SerializedFunction', 'WSDLGeneratedSOAPFunction' )

PurgeSession = 
function (parameters, server = new("HTTPSOAPServer", host = "gmd.mpimp-golm.mpg.de", 
    port = NA_integer_, url = "/webservices/wsGoBioSpace.asmx"), 
    .convert = new("Element", name = NULL, attributes = "PurgeSessionResponse", 
        xmlAttrs = list(), ns = character(0), nsuri = character(0), 
        Rname = character(0), documentation = character(0), character(0)), 
    .opts = list(), nameSpaces = "1.2", .soapHeader = NULL) 
{
    .SOAP(server, "PurgeSession", parameters = as(parameters, 
        "guid"), action = "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/PurgeSession", 
        xmlns = "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/", 
        .types = list(parameters = new("LocalElement", count = c(1, 
        1), type = new("RestrictedStringPatternDefinition", pattern = "[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}", 
            fromConverter = function (from) 
            {
                if (is(from, "XMLAbstractNode")) from = xmlValue(from)
                as(from, "character")
            }, toConverter = function (from, epattern = "^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$") 
            {
                x = as(from, "character")
                if (length(grep(epattern, x)) == 0) stop("Invalid string: doesn't match expected pattern")
                x
            }, count = numeric(0), abstract = logical(0), name = "guid", 
            ns = "xsd", nsuri = "http://www.w3.org/2001/XMLSchema", 
            Rname = character(0), documentation = character(0)), 
            name = "SessionID", attributes = list(), xmlAttrs = character(0), 
            ns = character(0), nsuri = "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/", 
            Rname = character(0), documentation = character(0))), 
        .convert = .convert, .header = c(Accept = "text/xml", 
            Accept = "multipart/*", `Content-Type` = "text/xml; charset=utf-8", 
            SOAPAction = "\"http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/PurgeSession\""), 
        .opts = .opts, .literal = TRUE, nameSpaces = nameSpaces, 
        .elementFormQualified = TRUE, .returnNodeName = "PurgeSessionResponse", 
        .soapHeader = .soapHeader)
}

class( PurgeSession ) = c( 'SerializedFunction', 'WSDLGeneratedSOAPFunction' )

SearchMass12C = 
function (parameters = list(...), ..., server = new("HTTPSOAPServer", 
    host = "gmd.mpimp-golm.mpg.de", port = NA_integer_, url = "/webservices/wsGoBioSpace.asmx"), 
    .convert = new("LocalElement", count = c(0, 1), type = new("SimpleSequenceType", 
        elementType = character(0), elType = new("ExtendedClassDefinition", 
            base = "AdductHit", baseType = new("SOAPTypeReference", 
                count = numeric(0), abstract = logical(0), name = "AdductHit", 
                ns = "tns", nsuri = "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/", 
                Rname = character(0), documentation = character(0)), 
            slotTypes = list(fID = new("PrimitiveSOAPType", fromConverter = function () 
            NULL, toConverter = .Primitive("as.integer"), count = c(1, 
            1), abstract = logical(0), name = "int", ns = "s", 
                nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
                documentation = character(0)), formula = new("PrimitiveSOAPType", 
                fromConverter = function () 
                NULL, toConverter = .Primitive("as.character"), 
                count = c(0, 1), abstract = logical(0), name = "string", 
                ns = "s", nsuri = "http://www.w3.org/2001/XMLSchema", 
                Rname = character(0), documentation = character(0))), 
            isAttribute = c(FALSE, FALSE), uris = character(0), 
            fromConverter = function () 
            NULL, toConverter = function () 
            NULL, count = numeric(0), abstract = logical(0), 
            name = "MassSearchHit", ns = character(0), nsuri = "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/", 
            Rname = character(0), documentation = character(0)), 
        fromConverter = function () 
        NULL, toConverter = function () 
        NULL, count = c(0, Inf), abstract = logical(0), name = "ArrayOfMassSearchHit", 
        ns = character(0), nsuri = "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/", 
        Rname = character(0), documentation = character(0)), 
        name = "SearchMass12CResult", attributes = list(), xmlAttrs = character(0), 
        ns = character(0), nsuri = "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/", 
        Rname = character(0), documentation = character(0)), 
    .opts = list(), nameSpaces = "1.2", .soapHeader = NULL) 
{
    .SOAP(server, "SearchMass12C", parameters = as(parameters, 
        "SessionID.mass.tolerance"), action = "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/SearchMass12C", 
        xmlns = "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/", 
        .types = list(parameters = new("Element", type = new("ClassDefinition", 
            slotTypes = list(SessionID = new("RestrictedStringPatternDefinition", 
                pattern = "[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}", 
                fromConverter = function (from) 
                {
                  if (is(from, "XMLAbstractNode")) from = xmlValue(from)
                  as(from, "character")
                }, toConverter = function (from, epattern = "^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$") 
                {
                  x = as(from, "character")
                  if (length(grep(epattern, x)) == 0) stop("Invalid string: doesn't match expected pattern")
                  x
                }, count = numeric(0), abstract = logical(0), 
                name = "guid", ns = "xsd", nsuri = "http://www.w3.org/2001/XMLSchema", 
                Rname = character(0), documentation = character(0)), 
                mass = new("PrimitiveSOAPType", fromConverter = function () 
                NULL, toConverter = .Primitive("as.double"), 
                  count = c(1, 1), abstract = logical(0), name = "float", 
                  ns = "s", nsuri = "http://www.w3.org/2001/XMLSchema", 
                  Rname = character(0), documentation = character(0)), 
                tolerance = new("PrimitiveSOAPType", fromConverter = function () 
                NULL, toConverter = .Primitive("as.double"), 
                  count = c(1, 1), abstract = logical(0), name = "float", 
                  ns = "s", nsuri = "http://www.w3.org/2001/XMLSchema", 
                  Rname = character(0), documentation = character(0))), 
            isAttribute = c(FALSE, FALSE, FALSE), uris = c("http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/", 
            "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/", "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/"
            ), fromConverter = function () 
            NULL, toConverter = function () 
            NULL, count = numeric(0), abstract = logical(0), 
            name = "SessionID.mass.tolerance", ns = character(0), 
            nsuri = "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/", 
            Rname = character(0), documentation = character(0)), 
            name = "SearchMass12C", attributes = list(), xmlAttrs = character(0), 
            ns = character(0), nsuri = "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/", 
            Rname = character(0), documentation = character(0))), 
        .convert = .convert, .header = c(Accept = "text/xml", 
            Accept = "multipart/*", `Content-Type` = "text/xml; charset=utf-8", 
            SOAPAction = "\"http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/SearchMass12C\""), 
        .opts = .opts, .literal = TRUE, nameSpaces = nameSpaces, 
        .elementFormQualified = TRUE, .returnNodeName = "SearchMass12CResponse", 
        .soapHeader = .soapHeader)
}

class( SearchMass12C ) = c( 'SerializedFunction', 'WSDLGeneratedSOAPFunction' )

SearchMass13C = 
function (parameters = list(...), ..., server = new("HTTPSOAPServer", 
    host = "gmd.mpimp-golm.mpg.de", port = NA_integer_, url = "/webservices/wsGoBioSpace.asmx"), 
    .convert = new("LocalElement", count = c(0, 1), type = new("SimpleSequenceType", 
        elementType = character(0), elType = new("ExtendedClassDefinition", 
            base = "AdductHit", baseType = new("SOAPTypeReference", 
                count = numeric(0), abstract = logical(0), name = "AdductHit", 
                ns = "tns", nsuri = "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/", 
                Rname = character(0), documentation = character(0)), 
            slotTypes = list(fID = new("PrimitiveSOAPType", fromConverter = function () 
            NULL, toConverter = .Primitive("as.integer"), count = c(1, 
            1), abstract = logical(0), name = "int", ns = "s", 
                nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
                documentation = character(0)), formula = new("PrimitiveSOAPType", 
                fromConverter = function () 
                NULL, toConverter = .Primitive("as.character"), 
                count = c(0, 1), abstract = logical(0), name = "string", 
                ns = "s", nsuri = "http://www.w3.org/2001/XMLSchema", 
                Rname = character(0), documentation = character(0))), 
            isAttribute = c(FALSE, FALSE), uris = character(0), 
            fromConverter = function () 
            NULL, toConverter = function () 
            NULL, count = numeric(0), abstract = logical(0), 
            name = "MassSearchHit", ns = character(0), nsuri = "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/", 
            Rname = character(0), documentation = character(0)), 
        fromConverter = function () 
        NULL, toConverter = function () 
        NULL, count = c(0, Inf), abstract = logical(0), name = "ArrayOfMassSearchHit", 
        ns = character(0), nsuri = "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/", 
        Rname = character(0), documentation = character(0)), 
        name = "SearchMass13CResult", attributes = list(), xmlAttrs = character(0), 
        ns = character(0), nsuri = "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/", 
        Rname = character(0), documentation = character(0)), 
    .opts = list(), nameSpaces = "1.2", .soapHeader = NULL) 
{
    .SOAP(server, "SearchMass13C", parameters = as(parameters, 
        "SessionID.mass.tolerance"), action = "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/SearchMass13C", 
        xmlns = "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/", 
        .types = list(parameters = new("Element", type = new("ClassDefinition", 
            slotTypes = list(SessionID = new("RestrictedStringPatternDefinition", 
                pattern = "[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}", 
                fromConverter = function (from) 
                {
                  if (is(from, "XMLAbstractNode")) from = xmlValue(from)
                  as(from, "character")
                }, toConverter = function (from, epattern = "^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$") 
                {
                  x = as(from, "character")
                  if (length(grep(epattern, x)) == 0) stop("Invalid string: doesn't match expected pattern")
                  x
                }, count = numeric(0), abstract = logical(0), 
                name = "guid", ns = "xsd", nsuri = "http://www.w3.org/2001/XMLSchema", 
                Rname = character(0), documentation = character(0)), 
                mass = new("PrimitiveSOAPType", fromConverter = function () 
                NULL, toConverter = .Primitive("as.double"), 
                  count = c(1, 1), abstract = logical(0), name = "float", 
                  ns = "s", nsuri = "http://www.w3.org/2001/XMLSchema", 
                  Rname = character(0), documentation = character(0)), 
                tolerance = new("PrimitiveSOAPType", fromConverter = function () 
                NULL, toConverter = .Primitive("as.double"), 
                  count = c(1, 1), abstract = logical(0), name = "float", 
                  ns = "s", nsuri = "http://www.w3.org/2001/XMLSchema", 
                  Rname = character(0), documentation = character(0))), 
            isAttribute = c(FALSE, FALSE, FALSE), uris = c("http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/", 
            "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/", "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/"
            ), fromConverter = function () 
            NULL, toConverter = function () 
            NULL, count = numeric(0), abstract = logical(0), 
            name = "SessionID.mass.tolerance", ns = character(0), 
            nsuri = "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/", 
            Rname = character(0), documentation = character(0)), 
            name = "SearchMass13C", attributes = list(), xmlAttrs = character(0), 
            ns = character(0), nsuri = "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/", 
            Rname = character(0), documentation = character(0))), 
        .convert = .convert, .header = c(Accept = "text/xml", 
            Accept = "multipart/*", `Content-Type` = "text/xml; charset=utf-8", 
            SOAPAction = "\"http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/SearchMass13C\""), 
        .opts = .opts, .literal = TRUE, nameSpaces = nameSpaces, 
        .elementFormQualified = TRUE, .returnNodeName = "SearchMass13CResponse", 
        .soapHeader = .soapHeader)
}

class( SearchMass13C ) = c( 'SerializedFunction', 'WSDLGeneratedSOAPFunction' )

SearchMass15N = 
function (parameters = list(...), ..., server = new("HTTPSOAPServer", 
    host = "gmd.mpimp-golm.mpg.de", port = NA_integer_, url = "/webservices/wsGoBioSpace.asmx"), 
    .convert = new("LocalElement", count = c(0, 1), type = new("SimpleSequenceType", 
        elementType = character(0), elType = new("ExtendedClassDefinition", 
            base = "AdductHit", baseType = new("SOAPTypeReference", 
                count = numeric(0), abstract = logical(0), name = "AdductHit", 
                ns = "tns", nsuri = "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/", 
                Rname = character(0), documentation = character(0)), 
            slotTypes = list(fID = new("PrimitiveSOAPType", fromConverter = function () 
            NULL, toConverter = .Primitive("as.integer"), count = c(1, 
            1), abstract = logical(0), name = "int", ns = "s", 
                nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
                documentation = character(0)), formula = new("PrimitiveSOAPType", 
                fromConverter = function () 
                NULL, toConverter = .Primitive("as.character"), 
                count = c(0, 1), abstract = logical(0), name = "string", 
                ns = "s", nsuri = "http://www.w3.org/2001/XMLSchema", 
                Rname = character(0), documentation = character(0))), 
            isAttribute = c(FALSE, FALSE), uris = character(0), 
            fromConverter = function () 
            NULL, toConverter = function () 
            NULL, count = numeric(0), abstract = logical(0), 
            name = "MassSearchHit", ns = character(0), nsuri = "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/", 
            Rname = character(0), documentation = character(0)), 
        fromConverter = function () 
        NULL, toConverter = function () 
        NULL, count = c(0, Inf), abstract = logical(0), name = "ArrayOfMassSearchHit", 
        ns = character(0), nsuri = "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/", 
        Rname = character(0), documentation = character(0)), 
        name = "SearchMass15NResult", attributes = list(), xmlAttrs = character(0), 
        ns = character(0), nsuri = "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/", 
        Rname = character(0), documentation = character(0)), 
    .opts = list(), nameSpaces = "1.2", .soapHeader = NULL) 
{
    .SOAP(server, "SearchMass15N", parameters = as(parameters, 
        "SessionID.mass.tolerance"), action = "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/SearchMass15N", 
        xmlns = "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/", 
        .types = list(parameters = new("Element", type = new("ClassDefinition", 
            slotTypes = list(SessionID = new("RestrictedStringPatternDefinition", 
                pattern = "[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}", 
                fromConverter = function (from) 
                {
                  if (is(from, "XMLAbstractNode")) from = xmlValue(from)
                  as(from, "character")
                }, toConverter = function (from, epattern = "^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$") 
                {
                  x = as(from, "character")
                  if (length(grep(epattern, x)) == 0) stop("Invalid string: doesn't match expected pattern")
                  x
                }, count = numeric(0), abstract = logical(0), 
                name = "guid", ns = "xsd", nsuri = "http://www.w3.org/2001/XMLSchema", 
                Rname = character(0), documentation = character(0)), 
                mass = new("PrimitiveSOAPType", fromConverter = function () 
                NULL, toConverter = .Primitive("as.double"), 
                  count = c(1, 1), abstract = logical(0), name = "float", 
                  ns = "s", nsuri = "http://www.w3.org/2001/XMLSchema", 
                  Rname = character(0), documentation = character(0)), 
                tolerance = new("PrimitiveSOAPType", fromConverter = function () 
                NULL, toConverter = .Primitive("as.double"), 
                  count = c(1, 1), abstract = logical(0), name = "float", 
                  ns = "s", nsuri = "http://www.w3.org/2001/XMLSchema", 
                  Rname = character(0), documentation = character(0))), 
            isAttribute = c(FALSE, FALSE, FALSE), uris = c("http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/", 
            "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/", "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/"
            ), fromConverter = function () 
            NULL, toConverter = function () 
            NULL, count = numeric(0), abstract = logical(0), 
            name = "SessionID.mass.tolerance", ns = character(0), 
            nsuri = "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/", 
            Rname = character(0), documentation = character(0)), 
            name = "SearchMass15N", attributes = list(), xmlAttrs = character(0), 
            ns = character(0), nsuri = "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/", 
            Rname = character(0), documentation = character(0))), 
        .convert = .convert, .header = c(Accept = "text/xml", 
            Accept = "multipart/*", `Content-Type` = "text/xml; charset=utf-8", 
            SOAPAction = "\"http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/SearchMass15N\""), 
        .opts = .opts, .literal = TRUE, nameSpaces = nameSpaces, 
        .elementFormQualified = TRUE, .returnNodeName = "SearchMass15NResponse", 
        .soapHeader = .soapHeader)
}

class( SearchMass15N ) = c( 'SerializedFunction', 'WSDLGeneratedSOAPFunction' )

SearchMass34S = 
function (parameters = list(...), ..., server = new("HTTPSOAPServer", 
    host = "gmd.mpimp-golm.mpg.de", port = NA_integer_, url = "/webservices/wsGoBioSpace.asmx"), 
    .convert = new("LocalElement", count = c(0, 1), type = new("SimpleSequenceType", 
        elementType = character(0), elType = new("ExtendedClassDefinition", 
            base = "AdductHit", baseType = new("SOAPTypeReference", 
                count = numeric(0), abstract = logical(0), name = "AdductHit", 
                ns = "tns", nsuri = "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/", 
                Rname = character(0), documentation = character(0)), 
            slotTypes = list(fID = new("PrimitiveSOAPType", fromConverter = function () 
            NULL, toConverter = .Primitive("as.integer"), count = c(1, 
            1), abstract = logical(0), name = "int", ns = "s", 
                nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
                documentation = character(0)), formula = new("PrimitiveSOAPType", 
                fromConverter = function () 
                NULL, toConverter = .Primitive("as.character"), 
                count = c(0, 1), abstract = logical(0), name = "string", 
                ns = "s", nsuri = "http://www.w3.org/2001/XMLSchema", 
                Rname = character(0), documentation = character(0))), 
            isAttribute = c(FALSE, FALSE), uris = character(0), 
            fromConverter = function () 
            NULL, toConverter = function () 
            NULL, count = numeric(0), abstract = logical(0), 
            name = "MassSearchHit", ns = character(0), nsuri = "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/", 
            Rname = character(0), documentation = character(0)), 
        fromConverter = function () 
        NULL, toConverter = function () 
        NULL, count = c(0, Inf), abstract = logical(0), name = "ArrayOfMassSearchHit", 
        ns = character(0), nsuri = "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/", 
        Rname = character(0), documentation = character(0)), 
        name = "SearchMass34SResult", attributes = list(), xmlAttrs = character(0), 
        ns = character(0), nsuri = "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/", 
        Rname = character(0), documentation = character(0)), 
    .opts = list(), nameSpaces = "1.2", .soapHeader = NULL) 
{
    .SOAP(server, "SearchMass34S", parameters = as(parameters, 
        "SessionID.mass.tolerance"), action = "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/SearchMass34S", 
        xmlns = "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/", 
        .types = list(parameters = new("Element", type = new("ClassDefinition", 
            slotTypes = list(SessionID = new("RestrictedStringPatternDefinition", 
                pattern = "[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}", 
                fromConverter = function (from) 
                {
                  if (is(from, "XMLAbstractNode")) from = xmlValue(from)
                  as(from, "character")
                }, toConverter = function (from, epattern = "^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$") 
                {
                  x = as(from, "character")
                  if (length(grep(epattern, x)) == 0) stop("Invalid string: doesn't match expected pattern")
                  x
                }, count = numeric(0), abstract = logical(0), 
                name = "guid", ns = "xsd", nsuri = "http://www.w3.org/2001/XMLSchema", 
                Rname = character(0), documentation = character(0)), 
                mass = new("PrimitiveSOAPType", fromConverter = function () 
                NULL, toConverter = .Primitive("as.double"), 
                  count = c(1, 1), abstract = logical(0), name = "float", 
                  ns = "s", nsuri = "http://www.w3.org/2001/XMLSchema", 
                  Rname = character(0), documentation = character(0)), 
                tolerance = new("PrimitiveSOAPType", fromConverter = function () 
                NULL, toConverter = .Primitive("as.double"), 
                  count = c(1, 1), abstract = logical(0), name = "float", 
                  ns = "s", nsuri = "http://www.w3.org/2001/XMLSchema", 
                  Rname = character(0), documentation = character(0))), 
            isAttribute = c(FALSE, FALSE, FALSE), uris = c("http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/", 
            "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/", "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/"
            ), fromConverter = function () 
            NULL, toConverter = function () 
            NULL, count = numeric(0), abstract = logical(0), 
            name = "SessionID.mass.tolerance", ns = character(0), 
            nsuri = "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/", 
            Rname = character(0), documentation = character(0)), 
            name = "SearchMass34S", attributes = list(), xmlAttrs = character(0), 
            ns = character(0), nsuri = "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/", 
            Rname = character(0), documentation = character(0))), 
        .convert = .convert, .header = c(Accept = "text/xml", 
            Accept = "multipart/*", `Content-Type` = "text/xml; charset=utf-8", 
            SOAPAction = "\"http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/SearchMass34S\""), 
        .opts = .opts, .literal = TRUE, nameSpaces = nameSpaces, 
        .elementFormQualified = TRUE, .returnNodeName = "SearchMass34SResponse", 
        .soapHeader = .soapHeader)
}

class( SearchMass34S ) = c( 'SerializedFunction', 'WSDLGeneratedSOAPFunction' )

GetSynonyms = 
function (parameters = list(...), ..., server = new("HTTPSOAPServer", 
    host = "gmd.mpimp-golm.mpg.de", port = NA_integer_, url = "/webservices/wsGoBioSpace.asmx"), 
    .convert = new("LocalElement", count = c(0, 1), type = new("SimpleSequenceType", 
        elementType = character(0), elType = new("ClassDefinition", 
            slotTypes = list(value = new("PrimitiveSOAPType", 
                fromConverter = function () 
                NULL, toConverter = .Primitive("as.character"), 
                count = c(0, 1), abstract = logical(0), name = "string", 
                ns = "s", nsuri = "http://www.w3.org/2001/XMLSchema", 
                Rname = character(0), documentation = character(0)), 
                ID = new("PrimitiveSOAPType", fromConverter = function () 
                NULL, toConverter = .Primitive("as.integer"), 
                  count = numeric(0), abstract = logical(0), 
                  name = "int", ns = "s", nsuri = "http://www.w3.org/2001/XMLSchema", 
                  Rname = character(0), documentation = character(0)), 
                FormulaID = new("PrimitiveSOAPType", fromConverter = function () 
                NULL, toConverter = .Primitive("as.integer"), 
                  count = numeric(0), abstract = logical(0), 
                  name = "int", ns = "s", nsuri = "http://www.w3.org/2001/XMLSchema", 
                  Rname = character(0), documentation = character(0)), 
                PropertyID = new("PrimitiveSOAPType", fromConverter = function () 
                NULL, toConverter = .Primitive("as.integer"), 
                  count = numeric(0), abstract = logical(0), 
                  name = "unsignedByte", ns = "s", nsuri = "http://www.w3.org/2001/XMLSchema", 
                  Rname = character(0), documentation = character(0)), 
                DepositorID = new("PrimitiveSOAPType", fromConverter = function () 
                NULL, toConverter = .Primitive("as.integer"), 
                  count = numeric(0), abstract = logical(0), 
                  name = "short", ns = "s", nsuri = "http://www.w3.org/2001/XMLSchema", 
                  Rname = character(0), documentation = character(0)), 
                DepositorsPrimaryKey = new("PrimitiveSOAPType", 
                  fromConverter = function () 
                  NULL, toConverter = .Primitive("as.character"), 
                  count = numeric(0), abstract = logical(0), 
                  name = "string", ns = "s", nsuri = "http://www.w3.org/2001/XMLSchema", 
                  Rname = character(0), documentation = character(0))), 
            isAttribute = c(FALSE, TRUE, TRUE, TRUE, TRUE, TRUE
            ), uris = character(0), fromConverter = function () 
            NULL, toConverter = function () 
            NULL, count = numeric(0), abstract = logical(0), 
            name = "Synonym", ns = character(0), nsuri = character(0), 
            Rname = character(0), documentation = character(0)), 
        fromConverter = function () 
        NULL, toConverter = function () 
        NULL, count = c(0, Inf), abstract = logical(0), name = "ArrayOfSynonym", 
        ns = character(0), nsuri = "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/", 
        Rname = character(0), documentation = character(0)), 
        name = "GetSynonymsResult", attributes = list(), xmlAttrs = character(0), 
        ns = character(0), nsuri = "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/", 
        Rname = character(0), documentation = character(0)), 
    .opts = list(), nameSpaces = "1.2", .soapHeader = NULL) 
{
    .SOAP(server, "GetSynonyms", parameters = as(parameters, 
        "SessionID.FormulaID"), action = "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/GetSynonyms", 
        xmlns = "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/", 
        .types = list(parameters = new("Element", type = new("ClassDefinition", 
            slotTypes = list(SessionID = new("RestrictedStringPatternDefinition", 
                pattern = "[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}", 
                fromConverter = function (from) 
                {
                  if (is(from, "XMLAbstractNode")) from = xmlValue(from)
                  as(from, "character")
                }, toConverter = function (from, epattern = "^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$") 
                {
                  x = as(from, "character")
                  if (length(grep(epattern, x)) == 0) stop("Invalid string: doesn't match expected pattern")
                  x
                }, count = numeric(0), abstract = logical(0), 
                name = "guid", ns = "xsd", nsuri = "http://www.w3.org/2001/XMLSchema", 
                Rname = character(0), documentation = character(0)), 
                FormulaID = new("PrimitiveSOAPType", fromConverter = function () 
                NULL, toConverter = .Primitive("as.integer"), 
                  count = c(1, 1), abstract = logical(0), name = "int", 
                  ns = "s", nsuri = "http://www.w3.org/2001/XMLSchema", 
                  Rname = character(0), documentation = character(0))), 
            isAttribute = c(FALSE, FALSE), uris = c("http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/", 
            "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/"), 
            fromConverter = function () 
            NULL, toConverter = function () 
            NULL, count = numeric(0), abstract = logical(0), 
            name = "SessionID.FormulaID", ns = character(0), 
            nsuri = "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/", 
            Rname = character(0), documentation = character(0)), 
            name = "GetSynonyms", attributes = list(), xmlAttrs = character(0), 
            ns = character(0), nsuri = "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/", 
            Rname = character(0), documentation = character(0))), 
        .convert = .convert, .header = c(Accept = "text/xml", 
            Accept = "multipart/*", `Content-Type` = "text/xml; charset=utf-8", 
            SOAPAction = "\"http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/GetSynonyms\""), 
        .opts = .opts, .literal = TRUE, nameSpaces = nameSpaces, 
        .elementFormQualified = TRUE, .returnNodeName = "GetSynonymsResponse", 
        .soapHeader = .soapHeader)
}

class( GetSynonyms ) = c( 'SerializedFunction', 'WSDLGeneratedSOAPFunction' )

GetMonoisotopicWeight = 
function (parameters, server = new("HTTPSOAPServer", host = "gmd.mpimp-golm.mpg.de", 
    port = NA_integer_, url = "/webservices/wsGoBioSpace.asmx"), 
    .convert = new("LocalElement", count = c(1, 1), type = new("PrimitiveSOAPType", 
        fromConverter = function () 
        NULL, toConverter = .Primitive("as.double"), count = c(1, 
        1), abstract = logical(0), name = "double", ns = "s", 
        nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
        documentation = character(0)), name = "GetMonoisotopicWeightResult", 
        attributes = list(), xmlAttrs = character(0), ns = character(0), 
        nsuri = "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/", 
        Rname = character(0), documentation = character(0)), 
    .opts = list(), nameSpaces = "1.2", .soapHeader = NULL) 
{
    .SOAP(server, "GetMonoisotopicWeight", parameters = as.character(parameters), 
        action = "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/GetMonoisotopicWeight", 
        xmlns = "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/", 
        .types = list(parameters = new("LocalElement", count = c(0, 
        1), type = new("PrimitiveSOAPType", fromConverter = function () 
        NULL, toConverter = .Primitive("as.character"), count = c(0, 
        1), abstract = logical(0), name = "string", ns = "s", 
            nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
            documentation = character(0)), name = "Formula", 
            attributes = list(), xmlAttrs = character(0), ns = character(0), 
            nsuri = "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/", 
            Rname = character(0), documentation = character(0))), 
        .convert = .convert, .header = c(Accept = "text/xml", 
            Accept = "multipart/*", `Content-Type` = "text/xml; charset=utf-8", 
            SOAPAction = "\"http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/GetMonoisotopicWeight\""), 
        .opts = .opts, .literal = TRUE, nameSpaces = nameSpaces, 
        .elementFormQualified = TRUE, .returnNodeName = "GetMonoisotopicWeightResponse", 
        .soapHeader = .soapHeader)
}

class( GetMonoisotopicWeight ) = c( 'SerializedFunction', 'WSDLGeneratedSOAPFunction' )

GetMolecularWeight = 
function (parameters, server = new("HTTPSOAPServer", host = "gmd.mpimp-golm.mpg.de", 
    port = NA_integer_, url = "/webservices/wsGoBioSpace.asmx"), 
    .convert = new("LocalElement", count = c(1, 1), type = new("PrimitiveSOAPType", 
        fromConverter = function () 
        NULL, toConverter = .Primitive("as.double"), count = c(1, 
        1), abstract = logical(0), name = "double", ns = "s", 
        nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
        documentation = character(0)), name = "GetMolecularWeightResult", 
        attributes = list(), xmlAttrs = character(0), ns = character(0), 
        nsuri = "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/", 
        Rname = character(0), documentation = character(0)), 
    .opts = list(), nameSpaces = "1.2", .soapHeader = NULL) 
{
    .SOAP(server, "GetMolecularWeight", parameters = as.character(parameters), 
        action = "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/GetMolecularWeight", 
        xmlns = "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/", 
        .types = list(parameters = new("LocalElement", count = c(0, 
        1), type = new("PrimitiveSOAPType", fromConverter = function () 
        NULL, toConverter = .Primitive("as.character"), count = c(0, 
        1), abstract = logical(0), name = "string", ns = "s", 
            nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
            documentation = character(0)), name = "Formula", 
            attributes = list(), xmlAttrs = character(0), ns = character(0), 
            nsuri = "http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/", 
            Rname = character(0), documentation = character(0))), 
        .convert = .convert, .header = c(Accept = "text/xml", 
            Accept = "multipart/*", `Content-Type` = "text/xml; charset=utf-8", 
            SOAPAction = "\"http://gmd.mpimp-golm.mpg.de/GoBioSpace/v02/GetMolecularWeight\""), 
        .opts = .opts, .literal = TRUE, nameSpaces = nameSpaces, 
        .elementFormQualified = TRUE, .returnNodeName = "GetMolecularWeightResponse", 
        .soapHeader = .soapHeader)
}

class( GetMolecularWeight ) = c( 'SerializedFunction', 'WSDLGeneratedSOAPFunction' )

