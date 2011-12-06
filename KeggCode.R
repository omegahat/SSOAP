library(SSOAP)
library(XML)
setClass( 'ArrayOfstring' ,
	   representation(
		.Data = 'character') ,
	   contains = c( 'character' )
 ) 
setAs('XMLInternalElementNode', 'ArrayOfstring',


function (from, to = "ArrayOfstring", strict = TRUE) 
xmlSApply(from, as, "character")


)
setAs('integer', 'ArrayOfstring',


function (from, to = "ArrayOfstring", strict = TRUE) 
new("ArrayOfstring", as(from, "integer"))


)
setAs('numeric', 'ArrayOfstring',


function (from, to = "ArrayOfstring", strict = TRUE) 
new("ArrayOfstring", as(from, "numeric"))


)
setAs('logical', 'ArrayOfstring',


function (from, to = "ArrayOfstring", strict = TRUE) 
new("ArrayOfstring", as(from, "logical"))


)
setClass( 'SSDBRelation' ,
	   representation(
		genes_id1 = 'character',
		genes_id2 = 'character',
		sw_score = 'integer',
		bit_score = 'numeric',
		identity = 'numeric',
		overlap = 'integer',
		start_position1 = 'integer',
		end_position1 = 'integer',
		start_position2 = 'integer',
		end_position2 = 'integer',
		best_flag_1to2 = 'logical',
		best_flag_2to1 = 'logical',
		definition1 = 'character',
		definition2 = 'character',
		length1 = 'integer',
		length2 = 'integer') ,
	   contains = c( 'VirtualSOAPClass' )
 ) 
setClass( 'ArrayOfSSDBRelation' ,
	   representation(
		.Data = 'list') ,
	   contains = c( 'list' )
 ) 
setAs('XMLInternalElementNode', 'ArrayOfSSDBRelation',


function (from, to = "ArrayOfSSDBRelation", strict = TRUE) 
xmlSApply(from, as, "SSDBRelation")


)
setClass( 'MotifResult' ,
	   representation(
		motif_id = 'character',
		definition = 'character',
		genes_id = 'character',
		start_position = 'integer',
		end_position = 'integer',
		score = 'numeric',
		evalue = 'numeric') ,
	   contains = c( 'VirtualSOAPClass' )
 ) 
setClass( 'ArrayOfMotifResult' ,
	   representation(
		.Data = 'list') ,
	   contains = c( 'list' )
 ) 
setAs('XMLInternalElementNode', 'ArrayOfMotifResult',


function (from, to = "ArrayOfMotifResult", strict = TRUE) 
xmlSApply(from, as, "MotifResult")


)
setClass( 'Definition' ,
	   representation(
		entry_id = 'character',
		definition = 'character') ,
	   contains = c( 'VirtualSOAPClass' )
 ) 
setClass( 'ArrayOfDefinition' ,
	   representation(
		.Data = 'list') ,
	   contains = c( 'list' )
 ) 
setAs('XMLInternalElementNode', 'ArrayOfDefinition',


function (from, to = "ArrayOfDefinition", strict = TRUE) 
xmlSApply(from, as, "Definition")


)
setClass( 'LinkDBRelation' ,
	   representation(
		entry_id1 = 'character',
		entry_id2 = 'character',
		type = 'character',
		path = 'character') ,
	   contains = c( 'VirtualSOAPClass' )
 ) 
setClass( 'ArrayOfLinkDBRelation' ,
	   representation(
		.Data = 'list') ,
	   contains = c( 'list' )
 ) 
setAs('XMLInternalElementNode', 'ArrayOfLinkDBRelation',


function (from, to = "ArrayOfLinkDBRelation", strict = TRUE) 
xmlSApply(from, as, "LinkDBRelation")


)
list_databases = 
function (server = new("HTTPSOAPServer", host = "soap.genome.jp", 
    port = NA_integer_, url = "/keggapi/request_v4.1.cgi"), .convert = new("ArrayType", 
    dims = NA_integer_, elementType = "typens:Definition", elType = new("SOAPTypeReference", 
        count = numeric(0), abstract = logical(0), name = "Definition", 
        ns = "typens", nsuri = "SOAP/KEGG", Rname = character(0), 
        documentation = character(0)), fromConverter = function () 
    NULL, toConverter = function () 
    NULL, count = numeric(0), abstract = logical(0), name = "ArrayOfDefinition", 
    ns = character(0), nsuri = "SOAP/KEGG", Rname = character(0), 
    documentation = character(0)), .opts = list(), nameSpaces = "1.2", 
    .soapHeader = NULL) 
{
    .SOAP(server, "list_databases", action = "SOAP/KEGG#list_databases", 
        xmlns = "SOAP/KEGG", .types = list(), .convert = .convert, 
        .header = c(Accept = "text/xml", Accept = "multipart/*", 
            `Content-Type` = "text/xml; charset=utf-8", SOAPAction = "\"SOAP/KEGG#list_databases\""), 
        .opts = .opts, nameSpaces = nameSpaces, .elementFormQualified = TRUE, 
        .returnNodeName = "return", .soapHeader = .soapHeader)
}

class( list_databases ) = c( 'SerializedFunction', 'WSDLGeneratedSOAPFunction' )

list_organisms = 
function (server = new("HTTPSOAPServer", host = "soap.genome.jp", 
    port = NA_integer_, url = "/keggapi/request_v4.1.cgi"), .convert = new("ArrayType", 
    dims = NA_integer_, elementType = "typens:Definition", elType = new("SOAPTypeReference", 
        count = numeric(0), abstract = logical(0), name = "Definition", 
        ns = "typens", nsuri = "SOAP/KEGG", Rname = character(0), 
        documentation = character(0)), fromConverter = function () 
    NULL, toConverter = function () 
    NULL, count = numeric(0), abstract = logical(0), name = "ArrayOfDefinition", 
    ns = character(0), nsuri = "SOAP/KEGG", Rname = character(0), 
    documentation = character(0)), .opts = list(), nameSpaces = "1.2", 
    .soapHeader = NULL) 
{
    .SOAP(server, "list_organisms", action = "SOAP/KEGG#list_organisms", 
        xmlns = "SOAP/KEGG", .types = list(), .convert = .convert, 
        .header = c(Accept = "text/xml", Accept = "multipart/*", 
            `Content-Type` = "text/xml; charset=utf-8", SOAPAction = "\"SOAP/KEGG#list_organisms\""), 
        .opts = .opts, nameSpaces = nameSpaces, .elementFormQualified = TRUE, 
        .returnNodeName = "return", .soapHeader = .soapHeader)
}

class( list_organisms ) = c( 'SerializedFunction', 'WSDLGeneratedSOAPFunction' )

list_pathways = 
function (org, server = new("HTTPSOAPServer", host = "soap.genome.jp", 
    port = NA_integer_, url = "/keggapi/request_v4.1.cgi"), .convert = new("ArrayType", 
    dims = NA_integer_, elementType = "typens:Definition", elType = new("SOAPTypeReference", 
        count = numeric(0), abstract = logical(0), name = "Definition", 
        ns = "typens", nsuri = "SOAP/KEGG", Rname = character(0), 
        documentation = character(0)), fromConverter = function () 
    NULL, toConverter = function () 
    NULL, count = numeric(0), abstract = logical(0), name = "ArrayOfDefinition", 
    ns = character(0), nsuri = "SOAP/KEGG", Rname = character(0), 
    documentation = character(0)), .opts = list(), nameSpaces = "1.2", 
    .soapHeader = NULL) 
{
    .SOAP(server, "list_pathways", org = as.character(org), action = "SOAP/KEGG#list_pathways", 
        xmlns = "SOAP/KEGG", .types = list(org = new("PrimitiveSOAPType", 
            fromConverter = function () 
            NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
            abstract = logical(0), name = "string", ns = "xsd", 
            nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
            documentation = character(0))), .convert = .convert, 
        .header = c(Accept = "text/xml", Accept = "multipart/*", 
            `Content-Type` = "text/xml; charset=utf-8", SOAPAction = "\"SOAP/KEGG#list_pathways\""), 
        .opts = .opts, nameSpaces = nameSpaces, .elementFormQualified = TRUE, 
        .returnNodeName = "return", .soapHeader = .soapHeader)
}

class( list_pathways ) = c( 'SerializedFunction', 'WSDLGeneratedSOAPFunction' )

list_ko_classes = 
function (class_id, server = new("HTTPSOAPServer", host = "soap.genome.jp", 
    port = NA_integer_, url = "/keggapi/request_v4.1.cgi"), .convert = new("ArrayType", 
    dims = NA_integer_, elementType = "typens:Definition", elType = new("SOAPTypeReference", 
        count = numeric(0), abstract = logical(0), name = "Definition", 
        ns = "typens", nsuri = "SOAP/KEGG", Rname = character(0), 
        documentation = character(0)), fromConverter = function () 
    NULL, toConverter = function () 
    NULL, count = numeric(0), abstract = logical(0), name = "ArrayOfDefinition", 
    ns = character(0), nsuri = "SOAP/KEGG", Rname = character(0), 
    documentation = character(0)), .opts = list(), nameSpaces = "1.2", 
    .soapHeader = NULL) 
{
    .SOAP(server, "list_ko_classes", class_id = as.character(class_id), 
        action = "SOAP/KEGG#list_ko_classes", xmlns = "SOAP/KEGG", 
        .types = list(class_id = new("PrimitiveSOAPType", fromConverter = function () 
        NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
            abstract = logical(0), name = "string", ns = "xsd", 
            nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
            documentation = character(0))), .convert = .convert, 
        .header = c(Accept = "text/xml", Accept = "multipart/*", 
            `Content-Type` = "text/xml; charset=utf-8", SOAPAction = "\"SOAP/KEGG#list_ko_classes\""), 
        .opts = .opts, nameSpaces = nameSpaces, .elementFormQualified = TRUE, 
        .returnNodeName = "return", .soapHeader = .soapHeader)
}

class( list_ko_classes ) = c( 'SerializedFunction', 'WSDLGeneratedSOAPFunction' )

binfo = 
function (db, server = new("HTTPSOAPServer", host = "soap.genome.jp", 
    port = NA_integer_, url = "/keggapi/request_v4.1.cgi"), .convert = new("PrimitiveSOAPType", 
    fromConverter = function () 
    NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
    abstract = logical(0), name = "string", ns = "xsd", nsuri = "http://www.w3.org/2001/XMLSchema", 
    Rname = character(0), documentation = character(0)), .opts = list(), 
    nameSpaces = "1.2", .soapHeader = NULL) 
{
    .SOAP(server, "binfo", db = as.character(db), action = "SOAP/KEGG#binfo", 
        xmlns = "SOAP/KEGG", .types = list(db = new("PrimitiveSOAPType", 
            fromConverter = function () 
            NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
            abstract = logical(0), name = "string", ns = "xsd", 
            nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
            documentation = character(0))), .convert = .convert, 
        .header = c(Accept = "text/xml", Accept = "multipart/*", 
            `Content-Type` = "text/xml; charset=utf-8", SOAPAction = "\"SOAP/KEGG#binfo\""), 
        .opts = .opts, nameSpaces = nameSpaces, .elementFormQualified = TRUE, 
        .returnNodeName = "return", .soapHeader = .soapHeader)
}

class( binfo ) = c( 'SerializedFunction', 'WSDLGeneratedSOAPFunction' )

bget = 
function (string, server = new("HTTPSOAPServer", host = "soap.genome.jp", 
    port = NA_integer_, url = "/keggapi/request_v4.1.cgi"), .convert = new("PrimitiveSOAPType", 
    fromConverter = function () 
    NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
    abstract = logical(0), name = "string", ns = "xsd", nsuri = "http://www.w3.org/2001/XMLSchema", 
    Rname = character(0), documentation = character(0)), .opts = list(), 
    nameSpaces = "1.2", .soapHeader = NULL) 
{
    .SOAP(server, "bget", string = as.character(string), action = "SOAP/KEGG#bget", 
        xmlns = "SOAP/KEGG", .types = list(string = new("PrimitiveSOAPType", 
            fromConverter = function () 
            NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
            abstract = logical(0), name = "string", ns = "xsd", 
            nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
            documentation = character(0))), .convert = .convert, 
        .header = c(Accept = "text/xml", Accept = "multipart/*", 
            `Content-Type` = "text/xml; charset=utf-8", SOAPAction = "\"SOAP/KEGG#bget\""), 
        .opts = .opts, nameSpaces = nameSpaces, .elementFormQualified = TRUE, 
        .returnNodeName = "return", .soapHeader = .soapHeader)
}

class( bget ) = c( 'SerializedFunction', 'WSDLGeneratedSOAPFunction' )

bfind = 
function (string, server = new("HTTPSOAPServer", host = "soap.genome.jp", 
    port = NA_integer_, url = "/keggapi/request_v4.1.cgi"), .convert = new("PrimitiveSOAPType", 
    fromConverter = function () 
    NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
    abstract = logical(0), name = "string", ns = "xsd", nsuri = "http://www.w3.org/2001/XMLSchema", 
    Rname = character(0), documentation = character(0)), .opts = list(), 
    nameSpaces = "1.2", .soapHeader = NULL) 
{
    .SOAP(server, "bfind", string = as.character(string), action = "SOAP/KEGG#bfind", 
        xmlns = "SOAP/KEGG", .types = list(string = new("PrimitiveSOAPType", 
            fromConverter = function () 
            NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
            abstract = logical(0), name = "string", ns = "xsd", 
            nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
            documentation = character(0))), .convert = .convert, 
        .header = c(Accept = "text/xml", Accept = "multipart/*", 
            `Content-Type` = "text/xml; charset=utf-8", SOAPAction = "\"SOAP/KEGG#bfind\""), 
        .opts = .opts, nameSpaces = nameSpaces, .elementFormQualified = TRUE, 
        .returnNodeName = "return", .soapHeader = .soapHeader)
}

class( bfind ) = c( 'SerializedFunction', 'WSDLGeneratedSOAPFunction' )

btit = 
function (string, server = new("HTTPSOAPServer", host = "soap.genome.jp", 
    port = NA_integer_, url = "/keggapi/request_v4.1.cgi"), .convert = new("PrimitiveSOAPType", 
    fromConverter = function () 
    NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
    abstract = logical(0), name = "string", ns = "xsd", nsuri = "http://www.w3.org/2001/XMLSchema", 
    Rname = character(0), documentation = character(0)), .opts = list(), 
    nameSpaces = "1.2", .soapHeader = NULL) 
{
    .SOAP(server, "btit", string = as.character(string), action = "SOAP/KEGG#btit", 
        xmlns = "SOAP/KEGG", .types = list(string = new("PrimitiveSOAPType", 
            fromConverter = function () 
            NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
            abstract = logical(0), name = "string", ns = "xsd", 
            nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
            documentation = character(0))), .convert = .convert, 
        .header = c(Accept = "text/xml", Accept = "multipart/*", 
            `Content-Type` = "text/xml; charset=utf-8", SOAPAction = "\"SOAP/KEGG#btit\""), 
        .opts = .opts, nameSpaces = nameSpaces, .elementFormQualified = TRUE, 
        .returnNodeName = "return", .soapHeader = .soapHeader)
}

class( btit ) = c( 'SerializedFunction', 'WSDLGeneratedSOAPFunction' )

bconv = 
function (string, server = new("HTTPSOAPServer", host = "soap.genome.jp", 
    port = NA_integer_, url = "/keggapi/request_v4.1.cgi"), .convert = new("PrimitiveSOAPType", 
    fromConverter = function () 
    NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
    abstract = logical(0), name = "string", ns = "xsd", nsuri = "http://www.w3.org/2001/XMLSchema", 
    Rname = character(0), documentation = character(0)), .opts = list(), 
    nameSpaces = "1.2", .soapHeader = NULL) 
{
    .SOAP(server, "bconv", string = as.character(string), action = "SOAP/KEGG#bconv", 
        xmlns = "SOAP/KEGG", .types = list(string = new("PrimitiveSOAPType", 
            fromConverter = function () 
            NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
            abstract = logical(0), name = "string", ns = "xsd", 
            nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
            documentation = character(0))), .convert = .convert, 
        .header = c(Accept = "text/xml", Accept = "multipart/*", 
            `Content-Type` = "text/xml; charset=utf-8", SOAPAction = "\"SOAP/KEGG#bconv\""), 
        .opts = .opts, nameSpaces = nameSpaces, .elementFormQualified = TRUE, 
        .returnNodeName = "return", .soapHeader = .soapHeader)
}

class( bconv ) = c( 'SerializedFunction', 'WSDLGeneratedSOAPFunction' )

get_linkdb_by_entry = 
function (entry_id, db, start, max_results, server = new("HTTPSOAPServer", 
    host = "soap.genome.jp", port = NA_integer_, url = "/keggapi/request_v4.1.cgi"), 
    .convert = new("ArrayType", dims = NA_integer_, elementType = "typens:LinkDBRelation", 
        elType = new("SOAPTypeReference", count = numeric(0), 
            abstract = logical(0), name = "LinkDBRelation", ns = "typens", 
            nsuri = "SOAP/KEGG", Rname = character(0), documentation = character(0)), 
        fromConverter = function () 
        NULL, toConverter = function () 
        NULL, count = numeric(0), abstract = logical(0), name = "ArrayOfLinkDBRelation", 
        ns = character(0), nsuri = "SOAP/KEGG", Rname = character(0), 
        documentation = character(0)), .opts = list(), nameSpaces = "1.2", 
    .soapHeader = NULL) 
{
    .SOAP(server, "get_linkdb_by_entry", entry_id = as.character(entry_id), 
        db = as.character(db), start = as.integer(start), max_results = as.integer(max_results), 
        action = "SOAP/KEGG#get_linkdb_by_entry", xmlns = "SOAP/KEGG", 
        .types = list(entry_id = new("PrimitiveSOAPType", fromConverter = function () 
        NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
            abstract = logical(0), name = "string", ns = "xsd", 
            nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
            documentation = character(0)), db = new("PrimitiveSOAPType", 
            fromConverter = function () 
            NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
            abstract = logical(0), name = "string", ns = "xsd", 
            nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
            documentation = character(0)), start = new("PrimitiveSOAPType", 
            fromConverter = function () 
            NULL, toConverter = .Primitive("as.integer"), count = numeric(0), 
            abstract = logical(0), name = "int", ns = "xsd", 
            nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
            documentation = character(0)), max_results = new("PrimitiveSOAPType", 
            fromConverter = function () 
            NULL, toConverter = .Primitive("as.integer"), count = numeric(0), 
            abstract = logical(0), name = "int", ns = "xsd", 
            nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
            documentation = character(0))), .convert = .convert, 
        .header = c(Accept = "text/xml", Accept = "multipart/*", 
            `Content-Type` = "text/xml; charset=utf-8", SOAPAction = "\"SOAP/KEGG#get_linkdb_by_entry\""), 
        .opts = .opts, nameSpaces = nameSpaces, .elementFormQualified = TRUE, 
        .returnNodeName = "return", .soapHeader = .soapHeader)
}

class( get_linkdb_by_entry ) = c( 'SerializedFunction', 'WSDLGeneratedSOAPFunction' )

get_best_neighbors_by_gene = 
function (genes_id, start, max_results, server = new("HTTPSOAPServer", 
    host = "soap.genome.jp", port = NA_integer_, url = "/keggapi/request_v4.1.cgi"), 
    .convert = new("ArrayType", dims = NA_integer_, elementType = "typens:SSDBRelation", 
        elType = new("SOAPTypeReference", count = numeric(0), 
            abstract = logical(0), name = "SSDBRelation", ns = "typens", 
            nsuri = "SOAP/KEGG", Rname = character(0), documentation = character(0)), 
        fromConverter = function () 
        NULL, toConverter = function () 
        NULL, count = numeric(0), abstract = logical(0), name = "ArrayOfSSDBRelation", 
        ns = character(0), nsuri = "SOAP/KEGG", Rname = character(0), 
        documentation = character(0)), .opts = list(), nameSpaces = "1.2", 
    .soapHeader = NULL) 
{
    .SOAP(server, "get_best_neighbors_by_gene", genes_id = as.character(genes_id), 
        start = as.integer(start), max_results = as.integer(max_results), 
        action = "SOAP/KEGG#get_best_neighbors_by_gene", xmlns = "SOAP/KEGG", 
        .types = list(genes_id = new("PrimitiveSOAPType", fromConverter = function () 
        NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
            abstract = logical(0), name = "string", ns = "xsd", 
            nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
            documentation = character(0)), start = new("PrimitiveSOAPType", 
            fromConverter = function () 
            NULL, toConverter = .Primitive("as.integer"), count = numeric(0), 
            abstract = logical(0), name = "int", ns = "xsd", 
            nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
            documentation = character(0)), max_results = new("PrimitiveSOAPType", 
            fromConverter = function () 
            NULL, toConverter = .Primitive("as.integer"), count = numeric(0), 
            abstract = logical(0), name = "int", ns = "xsd", 
            nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
            documentation = character(0))), .convert = .convert, 
        .header = c(Accept = "text/xml", Accept = "multipart/*", 
            `Content-Type` = "text/xml; charset=utf-8", SOAPAction = "\"SOAP/KEGG#get_best_neighbors_by_gene\""), 
        .opts = .opts, nameSpaces = nameSpaces, .elementFormQualified = TRUE, 
        .returnNodeName = "return", .soapHeader = .soapHeader)
}

class( get_best_neighbors_by_gene ) = c( 'SerializedFunction', 'WSDLGeneratedSOAPFunction' )

get_best_best_neighbors_by_gene = 
function (genes_id, start, max_results, server = new("HTTPSOAPServer", 
    host = "soap.genome.jp", port = NA_integer_, url = "/keggapi/request_v4.1.cgi"), 
    .convert = new("ArrayType", dims = NA_integer_, elementType = "typens:SSDBRelation", 
        elType = new("SOAPTypeReference", count = numeric(0), 
            abstract = logical(0), name = "SSDBRelation", ns = "typens", 
            nsuri = "SOAP/KEGG", Rname = character(0), documentation = character(0)), 
        fromConverter = function () 
        NULL, toConverter = function () 
        NULL, count = numeric(0), abstract = logical(0), name = "ArrayOfSSDBRelation", 
        ns = character(0), nsuri = "SOAP/KEGG", Rname = character(0), 
        documentation = character(0)), .opts = list(), nameSpaces = "1.2", 
    .soapHeader = NULL) 
{
    .SOAP(server, "get_best_best_neighbors_by_gene", genes_id = as.character(genes_id), 
        start = as.integer(start), max_results = as.integer(max_results), 
        action = "SOAP/KEGG#get_best_best_neighbors_by_gene", 
        xmlns = "SOAP/KEGG", .types = list(genes_id = new("PrimitiveSOAPType", 
            fromConverter = function () 
            NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
            abstract = logical(0), name = "string", ns = "xsd", 
            nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
            documentation = character(0)), start = new("PrimitiveSOAPType", 
            fromConverter = function () 
            NULL, toConverter = .Primitive("as.integer"), count = numeric(0), 
            abstract = logical(0), name = "int", ns = "xsd", 
            nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
            documentation = character(0)), max_results = new("PrimitiveSOAPType", 
            fromConverter = function () 
            NULL, toConverter = .Primitive("as.integer"), count = numeric(0), 
            abstract = logical(0), name = "int", ns = "xsd", 
            nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
            documentation = character(0))), .convert = .convert, 
        .header = c(Accept = "text/xml", Accept = "multipart/*", 
            `Content-Type` = "text/xml; charset=utf-8", SOAPAction = "\"SOAP/KEGG#get_best_best_neighbors_by_gene\""), 
        .opts = .opts, nameSpaces = nameSpaces, .elementFormQualified = TRUE, 
        .returnNodeName = "return", .soapHeader = .soapHeader)
}

class( get_best_best_neighbors_by_gene ) = c( 'SerializedFunction', 'WSDLGeneratedSOAPFunction' )

get_reverse_best_neighbors_by_gene = 
function (genes_id, start, max_results, server = new("HTTPSOAPServer", 
    host = "soap.genome.jp", port = NA_integer_, url = "/keggapi/request_v4.1.cgi"), 
    .convert = new("ArrayType", dims = NA_integer_, elementType = "typens:SSDBRelation", 
        elType = new("SOAPTypeReference", count = numeric(0), 
            abstract = logical(0), name = "SSDBRelation", ns = "typens", 
            nsuri = "SOAP/KEGG", Rname = character(0), documentation = character(0)), 
        fromConverter = function () 
        NULL, toConverter = function () 
        NULL, count = numeric(0), abstract = logical(0), name = "ArrayOfSSDBRelation", 
        ns = character(0), nsuri = "SOAP/KEGG", Rname = character(0), 
        documentation = character(0)), .opts = list(), nameSpaces = "1.2", 
    .soapHeader = NULL) 
{
    .SOAP(server, "get_reverse_best_neighbors_by_gene", genes_id = as.character(genes_id), 
        start = as.integer(start), max_results = as.integer(max_results), 
        action = "SOAP/KEGG#get_reverse_best_neighbors_by_gene", 
        xmlns = "SOAP/KEGG", .types = list(genes_id = new("PrimitiveSOAPType", 
            fromConverter = function () 
            NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
            abstract = logical(0), name = "string", ns = "xsd", 
            nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
            documentation = character(0)), start = new("PrimitiveSOAPType", 
            fromConverter = function () 
            NULL, toConverter = .Primitive("as.integer"), count = numeric(0), 
            abstract = logical(0), name = "int", ns = "xsd", 
            nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
            documentation = character(0)), max_results = new("PrimitiveSOAPType", 
            fromConverter = function () 
            NULL, toConverter = .Primitive("as.integer"), count = numeric(0), 
            abstract = logical(0), name = "int", ns = "xsd", 
            nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
            documentation = character(0))), .convert = .convert, 
        .header = c(Accept = "text/xml", Accept = "multipart/*", 
            `Content-Type` = "text/xml; charset=utf-8", SOAPAction = "\"SOAP/KEGG#get_reverse_best_neighbors_by_gene\""), 
        .opts = .opts, nameSpaces = nameSpaces, .elementFormQualified = TRUE, 
        .returnNodeName = "return", .soapHeader = .soapHeader)
}

class( get_reverse_best_neighbors_by_gene ) = c( 'SerializedFunction', 'WSDLGeneratedSOAPFunction' )

get_paralogs_by_gene = 
function (genes_id, start, max_results, server = new("HTTPSOAPServer", 
    host = "soap.genome.jp", port = NA_integer_, url = "/keggapi/request_v4.1.cgi"), 
    .convert = new("ArrayType", dims = NA_integer_, elementType = "typens:SSDBRelation", 
        elType = new("SOAPTypeReference", count = numeric(0), 
            abstract = logical(0), name = "SSDBRelation", ns = "typens", 
            nsuri = "SOAP/KEGG", Rname = character(0), documentation = character(0)), 
        fromConverter = function () 
        NULL, toConverter = function () 
        NULL, count = numeric(0), abstract = logical(0), name = "ArrayOfSSDBRelation", 
        ns = character(0), nsuri = "SOAP/KEGG", Rname = character(0), 
        documentation = character(0)), .opts = list(), nameSpaces = "1.2", 
    .soapHeader = NULL) 
{
    .SOAP(server, "get_paralogs_by_gene", genes_id = as.character(genes_id), 
        start = as.integer(start), max_results = as.integer(max_results), 
        action = "SOAP/KEGG#get_paralogs_by_gene", xmlns = "SOAP/KEGG", 
        .types = list(genes_id = new("PrimitiveSOAPType", fromConverter = function () 
        NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
            abstract = logical(0), name = "string", ns = "xsd", 
            nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
            documentation = character(0)), start = new("PrimitiveSOAPType", 
            fromConverter = function () 
            NULL, toConverter = .Primitive("as.integer"), count = numeric(0), 
            abstract = logical(0), name = "int", ns = "xsd", 
            nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
            documentation = character(0)), max_results = new("PrimitiveSOAPType", 
            fromConverter = function () 
            NULL, toConverter = .Primitive("as.integer"), count = numeric(0), 
            abstract = logical(0), name = "int", ns = "xsd", 
            nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
            documentation = character(0))), .convert = .convert, 
        .header = c(Accept = "text/xml", Accept = "multipart/*", 
            `Content-Type` = "text/xml; charset=utf-8", SOAPAction = "\"SOAP/KEGG#get_paralogs_by_gene\""), 
        .opts = .opts, nameSpaces = nameSpaces, .elementFormQualified = TRUE, 
        .returnNodeName = "return", .soapHeader = .soapHeader)
}

class( get_paralogs_by_gene ) = c( 'SerializedFunction', 'WSDLGeneratedSOAPFunction' )

get_motifs_by_gene = 
function (genes_id, db, server = new("HTTPSOAPServer", host = "soap.genome.jp", 
    port = NA_integer_, url = "/keggapi/request_v4.1.cgi"), .convert = new("ArrayType", 
    dims = NA_integer_, elementType = "typens:MotifResult", elType = new("SOAPTypeReference", 
        count = numeric(0), abstract = logical(0), name = "MotifResult", 
        ns = "typens", nsuri = "SOAP/KEGG", Rname = character(0), 
        documentation = character(0)), fromConverter = function () 
    NULL, toConverter = function () 
    NULL, count = numeric(0), abstract = logical(0), name = "ArrayOfMotifResult", 
    ns = character(0), nsuri = "SOAP/KEGG", Rname = character(0), 
    documentation = character(0)), .opts = list(), nameSpaces = "1.2", 
    .soapHeader = NULL) 
{
    .SOAP(server, "get_motifs_by_gene", genes_id = as.character(genes_id), 
        db = as.character(db), action = "SOAP/KEGG#get_motifs_by_gene", 
        xmlns = "SOAP/KEGG", .types = list(genes_id = new("PrimitiveSOAPType", 
            fromConverter = function () 
            NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
            abstract = logical(0), name = "string", ns = "xsd", 
            nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
            documentation = character(0)), db = new("PrimitiveSOAPType", 
            fromConverter = function () 
            NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
            abstract = logical(0), name = "string", ns = "xsd", 
            nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
            documentation = character(0))), .convert = .convert, 
        .header = c(Accept = "text/xml", Accept = "multipart/*", 
            `Content-Type` = "text/xml; charset=utf-8", SOAPAction = "\"SOAP/KEGG#get_motifs_by_gene\""), 
        .opts = .opts, nameSpaces = nameSpaces, .elementFormQualified = TRUE, 
        .returnNodeName = "return", .soapHeader = .soapHeader)
}

class( get_motifs_by_gene ) = c( 'SerializedFunction', 'WSDLGeneratedSOAPFunction' )

get_genes_by_motifs = 
function (motif_id_list, start, max_results, server = new("HTTPSOAPServer", 
    host = "soap.genome.jp", port = NA_integer_, url = "/keggapi/request_v4.1.cgi"), 
    .convert = new("ArrayType", dims = NA_integer_, elementType = "typens:Definition", 
        elType = new("SOAPTypeReference", count = numeric(0), 
            abstract = logical(0), name = "Definition", ns = "typens", 
            nsuri = "SOAP/KEGG", Rname = character(0), documentation = character(0)), 
        fromConverter = function () 
        NULL, toConverter = function () 
        NULL, count = numeric(0), abstract = logical(0), name = "ArrayOfDefinition", 
        ns = character(0), nsuri = "SOAP/KEGG", Rname = character(0), 
        documentation = character(0)), .opts = list(), nameSpaces = "1.2", 
    .soapHeader = NULL) 
{
    .SOAP(server, "get_genes_by_motifs", motif_id_list = as.character(motif_id_list), 
        start = as.integer(start), max_results = as.integer(max_results), 
        action = "SOAP/KEGG#get_genes_by_motifs", xmlns = "SOAP/KEGG", 
        .types = list(motif_id_list = new("ArrayType", dims = NA_integer_, 
            elementType = "xsd:string", elType = new("PrimitiveSOAPType", 
                fromConverter = function () 
                NULL, toConverter = .Primitive("as.character"), 
                count = numeric(0), abstract = logical(0), name = "string", 
                ns = "xsd", nsuri = "http://www.w3.org/2001/XMLSchema", 
                Rname = character(0), documentation = character(0)), 
            fromConverter = function () 
            NULL, toConverter = function () 
            NULL, count = numeric(0), abstract = logical(0), 
            name = "ArrayOfstring", ns = character(0), nsuri = "SOAP/KEGG", 
            Rname = character(0), documentation = character(0)), 
            start = new("PrimitiveSOAPType", fromConverter = function () 
            NULL, toConverter = .Primitive("as.integer"), count = numeric(0), 
                abstract = logical(0), name = "int", ns = "xsd", 
                nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
                documentation = character(0)), max_results = new("PrimitiveSOAPType", 
                fromConverter = function () 
                NULL, toConverter = .Primitive("as.integer"), 
                count = numeric(0), abstract = logical(0), name = "int", 
                ns = "xsd", nsuri = "http://www.w3.org/2001/XMLSchema", 
                Rname = character(0), documentation = character(0))), 
        .convert = .convert, .header = c(Accept = "text/xml", 
            Accept = "multipart/*", `Content-Type` = "text/xml; charset=utf-8", 
            SOAPAction = "\"SOAP/KEGG#get_genes_by_motifs\""), 
        .opts = .opts, nameSpaces = nameSpaces, .elementFormQualified = TRUE, 
        .returnNodeName = "return", .soapHeader = .soapHeader)
}

class( get_genes_by_motifs ) = c( 'SerializedFunction', 'WSDLGeneratedSOAPFunction' )

get_ko_by_gene = 
function (genes_id, server = new("HTTPSOAPServer", host = "soap.genome.jp", 
    port = NA_integer_, url = "/keggapi/request_v4.1.cgi"), .convert = new("ArrayType", 
    dims = NA_integer_, elementType = "xsd:string", elType = new("PrimitiveSOAPType", 
        fromConverter = function () 
        NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
        abstract = logical(0), name = "string", ns = "xsd", nsuri = "http://www.w3.org/2001/XMLSchema", 
        Rname = character(0), documentation = character(0)), 
    fromConverter = function () 
    NULL, toConverter = function () 
    NULL, count = numeric(0), abstract = logical(0), name = "ArrayOfstring", 
    ns = character(0), nsuri = "SOAP/KEGG", Rname = character(0), 
    documentation = character(0)), .opts = list(), nameSpaces = "1.2", 
    .soapHeader = NULL) 
{
    .SOAP(server, "get_ko_by_gene", genes_id = as.character(genes_id), 
        action = "SOAP/KEGG#get_ko_by_gene", xmlns = "SOAP/KEGG", 
        .types = list(genes_id = new("PrimitiveSOAPType", fromConverter = function () 
        NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
            abstract = logical(0), name = "string", ns = "xsd", 
            nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
            documentation = character(0))), .convert = .convert, 
        .header = c(Accept = "text/xml", Accept = "multipart/*", 
            `Content-Type` = "text/xml; charset=utf-8", SOAPAction = "\"SOAP/KEGG#get_ko_by_gene\""), 
        .opts = .opts, nameSpaces = nameSpaces, .elementFormQualified = TRUE, 
        .returnNodeName = "return", .soapHeader = .soapHeader)
}

class( get_ko_by_gene ) = c( 'SerializedFunction', 'WSDLGeneratedSOAPFunction' )

get_ko_by_ko_class = 
function (class_id, server = new("HTTPSOAPServer", host = "soap.genome.jp", 
    port = NA_integer_, url = "/keggapi/request_v4.1.cgi"), .convert = new("ArrayType", 
    dims = NA_integer_, elementType = "typens:Definition", elType = new("SOAPTypeReference", 
        count = numeric(0), abstract = logical(0), name = "Definition", 
        ns = "typens", nsuri = "SOAP/KEGG", Rname = character(0), 
        documentation = character(0)), fromConverter = function () 
    NULL, toConverter = function () 
    NULL, count = numeric(0), abstract = logical(0), name = "ArrayOfDefinition", 
    ns = character(0), nsuri = "SOAP/KEGG", Rname = character(0), 
    documentation = character(0)), .opts = list(), nameSpaces = "1.2", 
    .soapHeader = NULL) 
{
    .SOAP(server, "get_ko_by_ko_class", class_id = as.character(class_id), 
        action = "SOAP/KEGG#get_ko_by_ko_class", xmlns = "SOAP/KEGG", 
        .types = list(class_id = new("PrimitiveSOAPType", fromConverter = function () 
        NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
            abstract = logical(0), name = "string", ns = "xsd", 
            nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
            documentation = character(0))), .convert = .convert, 
        .header = c(Accept = "text/xml", Accept = "multipart/*", 
            `Content-Type` = "text/xml; charset=utf-8", SOAPAction = "\"SOAP/KEGG#get_ko_by_ko_class\""), 
        .opts = .opts, nameSpaces = nameSpaces, .elementFormQualified = TRUE, 
        .returnNodeName = "return", .soapHeader = .soapHeader)
}

class( get_ko_by_ko_class ) = c( 'SerializedFunction', 'WSDLGeneratedSOAPFunction' )

get_genes_by_ko = 
function (ko_id, org, server = new("HTTPSOAPServer", host = "soap.genome.jp", 
    port = NA_integer_, url = "/keggapi/request_v4.1.cgi"), .convert = new("ArrayType", 
    dims = NA_integer_, elementType = "typens:Definition", elType = new("SOAPTypeReference", 
        count = numeric(0), abstract = logical(0), name = "Definition", 
        ns = "typens", nsuri = "SOAP/KEGG", Rname = character(0), 
        documentation = character(0)), fromConverter = function () 
    NULL, toConverter = function () 
    NULL, count = numeric(0), abstract = logical(0), name = "ArrayOfDefinition", 
    ns = character(0), nsuri = "SOAP/KEGG", Rname = character(0), 
    documentation = character(0)), .opts = list(), nameSpaces = "1.2", 
    .soapHeader = NULL) 
{
    .SOAP(server, "get_genes_by_ko", ko_id = as.character(ko_id), 
        org = as.character(org), action = "SOAP/KEGG#get_genes_by_ko", 
        xmlns = "SOAP/KEGG", .types = list(ko_id = new("PrimitiveSOAPType", 
            fromConverter = function () 
            NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
            abstract = logical(0), name = "string", ns = "xsd", 
            nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
            documentation = character(0)), org = new("PrimitiveSOAPType", 
            fromConverter = function () 
            NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
            abstract = logical(0), name = "string", ns = "xsd", 
            nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
            documentation = character(0))), .convert = .convert, 
        .header = c(Accept = "text/xml", Accept = "multipart/*", 
            `Content-Type` = "text/xml; charset=utf-8", SOAPAction = "\"SOAP/KEGG#get_genes_by_ko\""), 
        .opts = .opts, nameSpaces = nameSpaces, .elementFormQualified = TRUE, 
        .returnNodeName = "return", .soapHeader = .soapHeader)
}

class( get_genes_by_ko ) = c( 'SerializedFunction', 'WSDLGeneratedSOAPFunction' )

get_genes_by_ko_class = 
function (class_id, org, start, max_results, server = new("HTTPSOAPServer", 
    host = "soap.genome.jp", port = NA_integer_, url = "/keggapi/request_v4.1.cgi"), 
    .convert = new("ArrayType", dims = NA_integer_, elementType = "typens:Definition", 
        elType = new("SOAPTypeReference", count = numeric(0), 
            abstract = logical(0), name = "Definition", ns = "typens", 
            nsuri = "SOAP/KEGG", Rname = character(0), documentation = character(0)), 
        fromConverter = function () 
        NULL, toConverter = function () 
        NULL, count = numeric(0), abstract = logical(0), name = "ArrayOfDefinition", 
        ns = character(0), nsuri = "SOAP/KEGG", Rname = character(0), 
        documentation = character(0)), .opts = list(), nameSpaces = "1.2", 
    .soapHeader = NULL) 
{
    .SOAP(server, "get_genes_by_ko_class", class_id = as.character(class_id), 
        org = as.character(org), start = as.integer(start), max_results = as.integer(max_results), 
        action = "SOAP/KEGG#get_genes_by_ko_class", xmlns = "SOAP/KEGG", 
        .types = list(class_id = new("PrimitiveSOAPType", fromConverter = function () 
        NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
            abstract = logical(0), name = "string", ns = "xsd", 
            nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
            documentation = character(0)), org = new("PrimitiveSOAPType", 
            fromConverter = function () 
            NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
            abstract = logical(0), name = "string", ns = "xsd", 
            nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
            documentation = character(0)), start = new("PrimitiveSOAPType", 
            fromConverter = function () 
            NULL, toConverter = .Primitive("as.integer"), count = numeric(0), 
            abstract = logical(0), name = "int", ns = "xsd", 
            nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
            documentation = character(0)), max_results = new("PrimitiveSOAPType", 
            fromConverter = function () 
            NULL, toConverter = .Primitive("as.integer"), count = numeric(0), 
            abstract = logical(0), name = "int", ns = "xsd", 
            nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
            documentation = character(0))), .convert = .convert, 
        .header = c(Accept = "text/xml", Accept = "multipart/*", 
            `Content-Type` = "text/xml; charset=utf-8", SOAPAction = "\"SOAP/KEGG#get_genes_by_ko_class\""), 
        .opts = .opts, nameSpaces = nameSpaces, .elementFormQualified = TRUE, 
        .returnNodeName = "return", .soapHeader = .soapHeader)
}

class( get_genes_by_ko_class ) = c( 'SerializedFunction', 'WSDLGeneratedSOAPFunction' )

get_oc_members_by_gene = 
function (genes_id, start, max_results, server = new("HTTPSOAPServer", 
    host = "soap.genome.jp", port = NA_integer_, url = "/keggapi/request_v4.1.cgi"), 
    .convert = new("ArrayType", dims = NA_integer_, elementType = "xsd:string", 
        elType = new("PrimitiveSOAPType", fromConverter = function () 
        NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
            abstract = logical(0), name = "string", ns = "xsd", 
            nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
            documentation = character(0)), fromConverter = function () 
        NULL, toConverter = function () 
        NULL, count = numeric(0), abstract = logical(0), name = "ArrayOfstring", 
        ns = character(0), nsuri = "SOAP/KEGG", Rname = character(0), 
        documentation = character(0)), .opts = list(), nameSpaces = "1.2", 
    .soapHeader = NULL) 
{
    .SOAP(server, "get_oc_members_by_gene", genes_id = as.character(genes_id), 
        start = as.integer(start), max_results = as.integer(max_results), 
        action = "SOAP/KEGG#get_oc_members_by_gene", xmlns = "SOAP/KEGG", 
        .types = list(genes_id = new("PrimitiveSOAPType", fromConverter = function () 
        NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
            abstract = logical(0), name = "string", ns = "xsd", 
            nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
            documentation = character(0)), start = new("PrimitiveSOAPType", 
            fromConverter = function () 
            NULL, toConverter = .Primitive("as.integer"), count = numeric(0), 
            abstract = logical(0), name = "int", ns = "xsd", 
            nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
            documentation = character(0)), max_results = new("PrimitiveSOAPType", 
            fromConverter = function () 
            NULL, toConverter = .Primitive("as.integer"), count = numeric(0), 
            abstract = logical(0), name = "int", ns = "xsd", 
            nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
            documentation = character(0))), .convert = .convert, 
        .header = c(Accept = "text/xml", Accept = "multipart/*", 
            `Content-Type` = "text/xml; charset=utf-8", SOAPAction = "\"SOAP/KEGG#get_oc_members_by_gene\""), 
        .opts = .opts, nameSpaces = nameSpaces, .elementFormQualified = TRUE, 
        .returnNodeName = "return", .soapHeader = .soapHeader)
}

class( get_oc_members_by_gene ) = c( 'SerializedFunction', 'WSDLGeneratedSOAPFunction' )

get_pc_members_by_gene = 
function (genes_id, start, max_results, server = new("HTTPSOAPServer", 
    host = "soap.genome.jp", port = NA_integer_, url = "/keggapi/request_v4.1.cgi"), 
    .convert = new("ArrayType", dims = NA_integer_, elementType = "xsd:string", 
        elType = new("PrimitiveSOAPType", fromConverter = function () 
        NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
            abstract = logical(0), name = "string", ns = "xsd", 
            nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
            documentation = character(0)), fromConverter = function () 
        NULL, toConverter = function () 
        NULL, count = numeric(0), abstract = logical(0), name = "ArrayOfstring", 
        ns = character(0), nsuri = "SOAP/KEGG", Rname = character(0), 
        documentation = character(0)), .opts = list(), nameSpaces = "1.2", 
    .soapHeader = NULL) 
{
    .SOAP(server, "get_pc_members_by_gene", genes_id = as.character(genes_id), 
        start = as.integer(start), max_results = as.integer(max_results), 
        action = "SOAP/KEGG#get_pc_members_by_gene", xmlns = "SOAP/KEGG", 
        .types = list(genes_id = new("PrimitiveSOAPType", fromConverter = function () 
        NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
            abstract = logical(0), name = "string", ns = "xsd", 
            nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
            documentation = character(0)), start = new("PrimitiveSOAPType", 
            fromConverter = function () 
            NULL, toConverter = .Primitive("as.integer"), count = numeric(0), 
            abstract = logical(0), name = "int", ns = "xsd", 
            nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
            documentation = character(0)), max_results = new("PrimitiveSOAPType", 
            fromConverter = function () 
            NULL, toConverter = .Primitive("as.integer"), count = numeric(0), 
            abstract = logical(0), name = "int", ns = "xsd", 
            nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
            documentation = character(0))), .convert = .convert, 
        .header = c(Accept = "text/xml", Accept = "multipart/*", 
            `Content-Type` = "text/xml; charset=utf-8", SOAPAction = "\"SOAP/KEGG#get_pc_members_by_gene\""), 
        .opts = .opts, nameSpaces = nameSpaces, .elementFormQualified = TRUE, 
        .returnNodeName = "return", .soapHeader = .soapHeader)
}

class( get_pc_members_by_gene ) = c( 'SerializedFunction', 'WSDLGeneratedSOAPFunction' )

mark_pathway_by_objects = 
function (pathway_id, object_id_list, server = new("HTTPSOAPServer", 
    host = "soap.genome.jp", port = NA_integer_, url = "/keggapi/request_v4.1.cgi"), 
    .convert = new("PrimitiveSOAPType", fromConverter = function () 
    NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
        abstract = logical(0), name = "string", ns = "xsd", nsuri = "http://www.w3.org/2001/XMLSchema", 
        Rname = character(0), documentation = character(0)), 
    .opts = list(), nameSpaces = "1.2", .soapHeader = NULL) 
{
    .SOAP(server, "mark_pathway_by_objects", pathway_id = as.character(pathway_id), 
        object_id_list = as.character(object_id_list), action = "SOAP/KEGG#mark_pathway_by_objects", 
        xmlns = "SOAP/KEGG", .types = list(pathway_id = new("PrimitiveSOAPType", 
            fromConverter = function () 
            NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
            abstract = logical(0), name = "string", ns = "xsd", 
            nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
            documentation = character(0)), object_id_list = new("ArrayType", 
            dims = NA_integer_, elementType = "xsd:string", elType = new("PrimitiveSOAPType", 
                fromConverter = function () 
                NULL, toConverter = .Primitive("as.character"), 
                count = numeric(0), abstract = logical(0), name = "string", 
                ns = "xsd", nsuri = "http://www.w3.org/2001/XMLSchema", 
                Rname = character(0), documentation = character(0)), 
            fromConverter = function () 
            NULL, toConverter = function () 
            NULL, count = numeric(0), abstract = logical(0), 
            name = "ArrayOfstring", ns = character(0), nsuri = "SOAP/KEGG", 
            Rname = character(0), documentation = character(0))), 
        .convert = .convert, .header = c(Accept = "text/xml", 
            Accept = "multipart/*", `Content-Type` = "text/xml; charset=utf-8", 
            SOAPAction = "\"SOAP/KEGG#mark_pathway_by_objects\""), 
        .opts = .opts, nameSpaces = nameSpaces, .elementFormQualified = TRUE, 
        .returnNodeName = "return", .soapHeader = .soapHeader)
}

class( mark_pathway_by_objects ) = c( 'SerializedFunction', 'WSDLGeneratedSOAPFunction' )

color_pathway_by_objects = 
function (pathway_id, object_id_list, fg_color_list, bg_color_list, 
    server = new("HTTPSOAPServer", host = "soap.genome.jp", port = NA_integer_, 
        url = "/keggapi/request_v4.1.cgi"), .convert = new("PrimitiveSOAPType", 
        fromConverter = function () 
        NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
        abstract = logical(0), name = "string", ns = "xsd", nsuri = "http://www.w3.org/2001/XMLSchema", 
        Rname = character(0), documentation = character(0)), 
    .opts = list(), nameSpaces = "1.2", .soapHeader = NULL) 
{
    .SOAP(server, "color_pathway_by_objects", pathway_id = as.character(pathway_id), 
        object_id_list = as.character(object_id_list), fg_color_list = as.character(fg_color_list), 
        bg_color_list = as.character(bg_color_list), action = "SOAP/KEGG#color_pathway_by_objects", 
        xmlns = "SOAP/KEGG", .types = list(pathway_id = new("PrimitiveSOAPType", 
            fromConverter = function () 
            NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
            abstract = logical(0), name = "string", ns = "xsd", 
            nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
            documentation = character(0)), object_id_list = new("ArrayType", 
            dims = NA_integer_, elementType = "xsd:string", elType = new("PrimitiveSOAPType", 
                fromConverter = function () 
                NULL, toConverter = .Primitive("as.character"), 
                count = numeric(0), abstract = logical(0), name = "string", 
                ns = "xsd", nsuri = "http://www.w3.org/2001/XMLSchema", 
                Rname = character(0), documentation = character(0)), 
            fromConverter = function () 
            NULL, toConverter = function () 
            NULL, count = numeric(0), abstract = logical(0), 
            name = "ArrayOfstring", ns = character(0), nsuri = "SOAP/KEGG", 
            Rname = character(0), documentation = character(0)), 
            fg_color_list = new("ArrayType", dims = NA_integer_, 
                elementType = "xsd:string", elType = new("PrimitiveSOAPType", 
                  fromConverter = function () 
                  NULL, toConverter = .Primitive("as.character"), 
                  count = numeric(0), abstract = logical(0), 
                  name = "string", ns = "xsd", nsuri = "http://www.w3.org/2001/XMLSchema", 
                  Rname = character(0), documentation = character(0)), 
                fromConverter = function () 
                NULL, toConverter = function () 
                NULL, count = numeric(0), abstract = logical(0), 
                name = "ArrayOfstring", ns = character(0), nsuri = "SOAP/KEGG", 
                Rname = character(0), documentation = character(0)), 
            bg_color_list = new("ArrayType", dims = NA_integer_, 
                elementType = "xsd:string", elType = new("PrimitiveSOAPType", 
                  fromConverter = function () 
                  NULL, toConverter = .Primitive("as.character"), 
                  count = numeric(0), abstract = logical(0), 
                  name = "string", ns = "xsd", nsuri = "http://www.w3.org/2001/XMLSchema", 
                  Rname = character(0), documentation = character(0)), 
                fromConverter = function () 
                NULL, toConverter = function () 
                NULL, count = numeric(0), abstract = logical(0), 
                name = "ArrayOfstring", ns = character(0), nsuri = "SOAP/KEGG", 
                Rname = character(0), documentation = character(0))), 
        .convert = .convert, .header = c(Accept = "text/xml", 
            Accept = "multipart/*", `Content-Type` = "text/xml; charset=utf-8", 
            SOAPAction = "\"SOAP/KEGG#color_pathway_by_objects\""), 
        .opts = .opts, nameSpaces = nameSpaces, .elementFormQualified = TRUE, 
        .returnNodeName = "return", .soapHeader = .soapHeader)
}

class( color_pathway_by_objects ) = c( 'SerializedFunction', 'WSDLGeneratedSOAPFunction' )

get_html_of_marked_pathway_by_objects = 
function (pathway_id, object_id_list, server = new("HTTPSOAPServer", 
    host = "soap.genome.jp", port = NA_integer_, url = "/keggapi/request_v4.1.cgi"), 
    .convert = new("PrimitiveSOAPType", fromConverter = function () 
    NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
        abstract = logical(0), name = "string", ns = "xsd", nsuri = "http://www.w3.org/2001/XMLSchema", 
        Rname = character(0), documentation = character(0)), 
    .opts = list(), nameSpaces = "1.2", .soapHeader = NULL) 
{
    .SOAP(server, "get_html_of_marked_pathway_by_objects", pathway_id = as.character(pathway_id), 
        object_id_list = as.character(object_id_list), action = "SOAP/KEGG#get_html_of_marked_pathway_by_objects", 
        xmlns = "SOAP/KEGG", .types = list(pathway_id = new("PrimitiveSOAPType", 
            fromConverter = function () 
            NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
            abstract = logical(0), name = "string", ns = "xsd", 
            nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
            documentation = character(0)), object_id_list = new("ArrayType", 
            dims = NA_integer_, elementType = "xsd:string", elType = new("PrimitiveSOAPType", 
                fromConverter = function () 
                NULL, toConverter = .Primitive("as.character"), 
                count = numeric(0), abstract = logical(0), name = "string", 
                ns = "xsd", nsuri = "http://www.w3.org/2001/XMLSchema", 
                Rname = character(0), documentation = character(0)), 
            fromConverter = function () 
            NULL, toConverter = function () 
            NULL, count = numeric(0), abstract = logical(0), 
            name = "ArrayOfstring", ns = character(0), nsuri = "SOAP/KEGG", 
            Rname = character(0), documentation = character(0))), 
        .convert = .convert, .header = c(Accept = "text/xml", 
            Accept = "multipart/*", `Content-Type` = "text/xml; charset=utf-8", 
            SOAPAction = "\"SOAP/KEGG#get_html_of_marked_pathway_by_objects\""), 
        .opts = .opts, nameSpaces = nameSpaces, .elementFormQualified = TRUE, 
        .returnNodeName = "return", .soapHeader = .soapHeader)
}

class( get_html_of_marked_pathway_by_objects ) = c( 'SerializedFunction', 'WSDLGeneratedSOAPFunction' )

get_html_of_colored_pathway_by_objects = 
function (pathway_id, object_id_list, fg_color_list, bg_color_list, 
    server = new("HTTPSOAPServer", host = "soap.genome.jp", port = NA_integer_, 
        url = "/keggapi/request_v4.1.cgi"), .convert = new("PrimitiveSOAPType", 
        fromConverter = function () 
        NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
        abstract = logical(0), name = "string", ns = "xsd", nsuri = "http://www.w3.org/2001/XMLSchema", 
        Rname = character(0), documentation = character(0)), 
    .opts = list(), nameSpaces = "1.2", .soapHeader = NULL) 
{
    .SOAP(server, "get_html_of_colored_pathway_by_objects", pathway_id = as.character(pathway_id), 
        object_id_list = as.character(object_id_list), fg_color_list = as.character(fg_color_list), 
        bg_color_list = as.character(bg_color_list), action = "SOAP/KEGG#get_html_of_colored_pathway_by_objects", 
        xmlns = "SOAP/KEGG", .types = list(pathway_id = new("PrimitiveSOAPType", 
            fromConverter = function () 
            NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
            abstract = logical(0), name = "string", ns = "xsd", 
            nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
            documentation = character(0)), object_id_list = new("ArrayType", 
            dims = NA_integer_, elementType = "xsd:string", elType = new("PrimitiveSOAPType", 
                fromConverter = function () 
                NULL, toConverter = .Primitive("as.character"), 
                count = numeric(0), abstract = logical(0), name = "string", 
                ns = "xsd", nsuri = "http://www.w3.org/2001/XMLSchema", 
                Rname = character(0), documentation = character(0)), 
            fromConverter = function () 
            NULL, toConverter = function () 
            NULL, count = numeric(0), abstract = logical(0), 
            name = "ArrayOfstring", ns = character(0), nsuri = "SOAP/KEGG", 
            Rname = character(0), documentation = character(0)), 
            fg_color_list = new("ArrayType", dims = NA_integer_, 
                elementType = "xsd:string", elType = new("PrimitiveSOAPType", 
                  fromConverter = function () 
                  NULL, toConverter = .Primitive("as.character"), 
                  count = numeric(0), abstract = logical(0), 
                  name = "string", ns = "xsd", nsuri = "http://www.w3.org/2001/XMLSchema", 
                  Rname = character(0), documentation = character(0)), 
                fromConverter = function () 
                NULL, toConverter = function () 
                NULL, count = numeric(0), abstract = logical(0), 
                name = "ArrayOfstring", ns = character(0), nsuri = "SOAP/KEGG", 
                Rname = character(0), documentation = character(0)), 
            bg_color_list = new("ArrayType", dims = NA_integer_, 
                elementType = "xsd:string", elType = new("PrimitiveSOAPType", 
                  fromConverter = function () 
                  NULL, toConverter = .Primitive("as.character"), 
                  count = numeric(0), abstract = logical(0), 
                  name = "string", ns = "xsd", nsuri = "http://www.w3.org/2001/XMLSchema", 
                  Rname = character(0), documentation = character(0)), 
                fromConverter = function () 
                NULL, toConverter = function () 
                NULL, count = numeric(0), abstract = logical(0), 
                name = "ArrayOfstring", ns = character(0), nsuri = "SOAP/KEGG", 
                Rname = character(0), documentation = character(0))), 
        .convert = .convert, .header = c(Accept = "text/xml", 
            Accept = "multipart/*", `Content-Type` = "text/xml; charset=utf-8", 
            SOAPAction = "\"SOAP/KEGG#get_html_of_colored_pathway_by_objects\""), 
        .opts = .opts, nameSpaces = nameSpaces, .elementFormQualified = TRUE, 
        .returnNodeName = "return", .soapHeader = .soapHeader)
}

class( get_html_of_colored_pathway_by_objects ) = c( 'SerializedFunction', 'WSDLGeneratedSOAPFunction' )

get_genes_by_pathway = 
function (pathway_id, server = new("HTTPSOAPServer", host = "soap.genome.jp", 
    port = NA_integer_, url = "/keggapi/request_v4.1.cgi"), .convert = new("ArrayType", 
    dims = NA_integer_, elementType = "xsd:string", elType = new("PrimitiveSOAPType", 
        fromConverter = function () 
        NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
        abstract = logical(0), name = "string", ns = "xsd", nsuri = "http://www.w3.org/2001/XMLSchema", 
        Rname = character(0), documentation = character(0)), 
    fromConverter = function () 
    NULL, toConverter = function () 
    NULL, count = numeric(0), abstract = logical(0), name = "ArrayOfstring", 
    ns = character(0), nsuri = "SOAP/KEGG", Rname = character(0), 
    documentation = character(0)), .opts = list(), nameSpaces = "1.2", 
    .soapHeader = NULL) 
{
    .SOAP(server, "get_genes_by_pathway", pathway_id = as.character(pathway_id), 
        action = "SOAP/KEGG#get_genes_by_pathway", xmlns = "SOAP/KEGG", 
        .types = list(pathway_id = new("PrimitiveSOAPType", fromConverter = function () 
        NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
            abstract = logical(0), name = "string", ns = "xsd", 
            nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
            documentation = character(0))), .convert = .convert, 
        .header = c(Accept = "text/xml", Accept = "multipart/*", 
            `Content-Type` = "text/xml; charset=utf-8", SOAPAction = "\"SOAP/KEGG#get_genes_by_pathway\""), 
        .opts = .opts, nameSpaces = nameSpaces, .elementFormQualified = TRUE, 
        .returnNodeName = "return", .soapHeader = .soapHeader)
}

class( get_genes_by_pathway ) = c( 'SerializedFunction', 'WSDLGeneratedSOAPFunction' )

get_enzymes_by_pathway = 
function (pathway_id, server = new("HTTPSOAPServer", host = "soap.genome.jp", 
    port = NA_integer_, url = "/keggapi/request_v4.1.cgi"), .convert = new("ArrayType", 
    dims = NA_integer_, elementType = "xsd:string", elType = new("PrimitiveSOAPType", 
        fromConverter = function () 
        NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
        abstract = logical(0), name = "string", ns = "xsd", nsuri = "http://www.w3.org/2001/XMLSchema", 
        Rname = character(0), documentation = character(0)), 
    fromConverter = function () 
    NULL, toConverter = function () 
    NULL, count = numeric(0), abstract = logical(0), name = "ArrayOfstring", 
    ns = character(0), nsuri = "SOAP/KEGG", Rname = character(0), 
    documentation = character(0)), .opts = list(), nameSpaces = "1.2", 
    .soapHeader = NULL) 
{
    .SOAP(server, "get_enzymes_by_pathway", pathway_id = as.character(pathway_id), 
        action = "SOAP/KEGG#get_enzymes_by_pathway", xmlns = "SOAP/KEGG", 
        .types = list(pathway_id = new("PrimitiveSOAPType", fromConverter = function () 
        NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
            abstract = logical(0), name = "string", ns = "xsd", 
            nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
            documentation = character(0))), .convert = .convert, 
        .header = c(Accept = "text/xml", Accept = "multipart/*", 
            `Content-Type` = "text/xml; charset=utf-8", SOAPAction = "\"SOAP/KEGG#get_enzymes_by_pathway\""), 
        .opts = .opts, nameSpaces = nameSpaces, .elementFormQualified = TRUE, 
        .returnNodeName = "return", .soapHeader = .soapHeader)
}

class( get_enzymes_by_pathway ) = c( 'SerializedFunction', 'WSDLGeneratedSOAPFunction' )

get_reactions_by_pathway = 
function (pathway_id, server = new("HTTPSOAPServer", host = "soap.genome.jp", 
    port = NA_integer_, url = "/keggapi/request_v4.1.cgi"), .convert = new("ArrayType", 
    dims = NA_integer_, elementType = "xsd:string", elType = new("PrimitiveSOAPType", 
        fromConverter = function () 
        NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
        abstract = logical(0), name = "string", ns = "xsd", nsuri = "http://www.w3.org/2001/XMLSchema", 
        Rname = character(0), documentation = character(0)), 
    fromConverter = function () 
    NULL, toConverter = function () 
    NULL, count = numeric(0), abstract = logical(0), name = "ArrayOfstring", 
    ns = character(0), nsuri = "SOAP/KEGG", Rname = character(0), 
    documentation = character(0)), .opts = list(), nameSpaces = "1.2", 
    .soapHeader = NULL) 
{
    .SOAP(server, "get_reactions_by_pathway", pathway_id = as.character(pathway_id), 
        action = "SOAP/KEGG#get_reactions_by_pathway", xmlns = "SOAP/KEGG", 
        .types = list(pathway_id = new("PrimitiveSOAPType", fromConverter = function () 
        NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
            abstract = logical(0), name = "string", ns = "xsd", 
            nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
            documentation = character(0))), .convert = .convert, 
        .header = c(Accept = "text/xml", Accept = "multipart/*", 
            `Content-Type` = "text/xml; charset=utf-8", SOAPAction = "\"SOAP/KEGG#get_reactions_by_pathway\""), 
        .opts = .opts, nameSpaces = nameSpaces, .elementFormQualified = TRUE, 
        .returnNodeName = "return", .soapHeader = .soapHeader)
}

class( get_reactions_by_pathway ) = c( 'SerializedFunction', 'WSDLGeneratedSOAPFunction' )

get_pathways_by_genes = 
function (genes_id_list, server = new("HTTPSOAPServer", host = "soap.genome.jp", 
    port = NA_integer_, url = "/keggapi/request_v4.1.cgi"), .convert = new("ArrayType", 
    dims = NA_integer_, elementType = "xsd:string", elType = new("PrimitiveSOAPType", 
        fromConverter = function () 
        NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
        abstract = logical(0), name = "string", ns = "xsd", nsuri = "http://www.w3.org/2001/XMLSchema", 
        Rname = character(0), documentation = character(0)), 
    fromConverter = function () 
    NULL, toConverter = function () 
    NULL, count = numeric(0), abstract = logical(0), name = "ArrayOfstring", 
    ns = character(0), nsuri = "SOAP/KEGG", Rname = character(0), 
    documentation = character(0)), .opts = list(), nameSpaces = "1.2", 
    .soapHeader = NULL) 
{
    .SOAP(server, "get_pathways_by_genes", genes_id_list = as.character(genes_id_list), 
        action = "SOAP/KEGG#get_pathways_by_genes", xmlns = "SOAP/KEGG", 
        .types = list(genes_id_list = new("ArrayType", dims = NA_integer_, 
            elementType = "xsd:string", elType = new("PrimitiveSOAPType", 
                fromConverter = function () 
                NULL, toConverter = .Primitive("as.character"), 
                count = numeric(0), abstract = logical(0), name = "string", 
                ns = "xsd", nsuri = "http://www.w3.org/2001/XMLSchema", 
                Rname = character(0), documentation = character(0)), 
            fromConverter = function () 
            NULL, toConverter = function () 
            NULL, count = numeric(0), abstract = logical(0), 
            name = "ArrayOfstring", ns = character(0), nsuri = "SOAP/KEGG", 
            Rname = character(0), documentation = character(0))), 
        .convert = .convert, .header = c(Accept = "text/xml", 
            Accept = "multipart/*", `Content-Type` = "text/xml; charset=utf-8", 
            SOAPAction = "\"SOAP/KEGG#get_pathways_by_genes\""), 
        .opts = .opts, nameSpaces = nameSpaces, .elementFormQualified = TRUE, 
        .returnNodeName = "return", .soapHeader = .soapHeader)
}

class( get_pathways_by_genes ) = c( 'SerializedFunction', 'WSDLGeneratedSOAPFunction' )

get_pathways_by_enzymes = 
function (enzyme_id_list, server = new("HTTPSOAPServer", host = "soap.genome.jp", 
    port = NA_integer_, url = "/keggapi/request_v4.1.cgi"), .convert = new("ArrayType", 
    dims = NA_integer_, elementType = "xsd:string", elType = new("PrimitiveSOAPType", 
        fromConverter = function () 
        NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
        abstract = logical(0), name = "string", ns = "xsd", nsuri = "http://www.w3.org/2001/XMLSchema", 
        Rname = character(0), documentation = character(0)), 
    fromConverter = function () 
    NULL, toConverter = function () 
    NULL, count = numeric(0), abstract = logical(0), name = "ArrayOfstring", 
    ns = character(0), nsuri = "SOAP/KEGG", Rname = character(0), 
    documentation = character(0)), .opts = list(), nameSpaces = "1.2", 
    .soapHeader = NULL) 
{
    .SOAP(server, "get_pathways_by_enzymes", enzyme_id_list = as.character(enzyme_id_list), 
        action = "SOAP/KEGG#get_pathways_by_enzymes", xmlns = "SOAP/KEGG", 
        .types = list(enzyme_id_list = new("ArrayType", dims = NA_integer_, 
            elementType = "xsd:string", elType = new("PrimitiveSOAPType", 
                fromConverter = function () 
                NULL, toConverter = .Primitive("as.character"), 
                count = numeric(0), abstract = logical(0), name = "string", 
                ns = "xsd", nsuri = "http://www.w3.org/2001/XMLSchema", 
                Rname = character(0), documentation = character(0)), 
            fromConverter = function () 
            NULL, toConverter = function () 
            NULL, count = numeric(0), abstract = logical(0), 
            name = "ArrayOfstring", ns = character(0), nsuri = "SOAP/KEGG", 
            Rname = character(0), documentation = character(0))), 
        .convert = .convert, .header = c(Accept = "text/xml", 
            Accept = "multipart/*", `Content-Type` = "text/xml; charset=utf-8", 
            SOAPAction = "\"SOAP/KEGG#get_pathways_by_enzymes\""), 
        .opts = .opts, nameSpaces = nameSpaces, .elementFormQualified = TRUE, 
        .returnNodeName = "return", .soapHeader = .soapHeader)
}

class( get_pathways_by_enzymes ) = c( 'SerializedFunction', 'WSDLGeneratedSOAPFunction' )

get_pathways_by_reactions = 
function (reaction_id_list, server = new("HTTPSOAPServer", host = "soap.genome.jp", 
    port = NA_integer_, url = "/keggapi/request_v4.1.cgi"), .convert = new("ArrayType", 
    dims = NA_integer_, elementType = "xsd:string", elType = new("PrimitiveSOAPType", 
        fromConverter = function () 
        NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
        abstract = logical(0), name = "string", ns = "xsd", nsuri = "http://www.w3.org/2001/XMLSchema", 
        Rname = character(0), documentation = character(0)), 
    fromConverter = function () 
    NULL, toConverter = function () 
    NULL, count = numeric(0), abstract = logical(0), name = "ArrayOfstring", 
    ns = character(0), nsuri = "SOAP/KEGG", Rname = character(0), 
    documentation = character(0)), .opts = list(), nameSpaces = "1.2", 
    .soapHeader = NULL) 
{
    .SOAP(server, "get_pathways_by_reactions", reaction_id_list = as.character(reaction_id_list), 
        action = "SOAP/KEGG#get_pathways_by_reactions", xmlns = "SOAP/KEGG", 
        .types = list(reaction_id_list = new("ArrayType", dims = NA_integer_, 
            elementType = "xsd:string", elType = new("PrimitiveSOAPType", 
                fromConverter = function () 
                NULL, toConverter = .Primitive("as.character"), 
                count = numeric(0), abstract = logical(0), name = "string", 
                ns = "xsd", nsuri = "http://www.w3.org/2001/XMLSchema", 
                Rname = character(0), documentation = character(0)), 
            fromConverter = function () 
            NULL, toConverter = function () 
            NULL, count = numeric(0), abstract = logical(0), 
            name = "ArrayOfstring", ns = character(0), nsuri = "SOAP/KEGG", 
            Rname = character(0), documentation = character(0))), 
        .convert = .convert, .header = c(Accept = "text/xml", 
            Accept = "multipart/*", `Content-Type` = "text/xml; charset=utf-8", 
            SOAPAction = "\"SOAP/KEGG#get_pathways_by_reactions\""), 
        .opts = .opts, nameSpaces = nameSpaces, .elementFormQualified = TRUE, 
        .returnNodeName = "return", .soapHeader = .soapHeader)
}

class( get_pathways_by_reactions ) = c( 'SerializedFunction', 'WSDLGeneratedSOAPFunction' )

get_linked_pathways = 
function (pathway_id, server = new("HTTPSOAPServer", host = "soap.genome.jp", 
    port = NA_integer_, url = "/keggapi/request_v4.1.cgi"), .convert = new("ArrayType", 
    dims = NA_integer_, elementType = "xsd:string", elType = new("PrimitiveSOAPType", 
        fromConverter = function () 
        NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
        abstract = logical(0), name = "string", ns = "xsd", nsuri = "http://www.w3.org/2001/XMLSchema", 
        Rname = character(0), documentation = character(0)), 
    fromConverter = function () 
    NULL, toConverter = function () 
    NULL, count = numeric(0), abstract = logical(0), name = "ArrayOfstring", 
    ns = character(0), nsuri = "SOAP/KEGG", Rname = character(0), 
    documentation = character(0)), .opts = list(), nameSpaces = "1.2", 
    .soapHeader = NULL) 
{
    .SOAP(server, "get_linked_pathways", pathway_id = as.character(pathway_id), 
        action = "SOAP/KEGG#get_linked_pathways", xmlns = "SOAP/KEGG", 
        .types = list(pathway_id = new("PrimitiveSOAPType", fromConverter = function () 
        NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
            abstract = logical(0), name = "string", ns = "xsd", 
            nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
            documentation = character(0))), .convert = .convert, 
        .header = c(Accept = "text/xml", Accept = "multipart/*", 
            `Content-Type` = "text/xml; charset=utf-8", SOAPAction = "\"SOAP/KEGG#get_linked_pathways\""), 
        .opts = .opts, nameSpaces = nameSpaces, .elementFormQualified = TRUE, 
        .returnNodeName = "return", .soapHeader = .soapHeader)
}

class( get_linked_pathways ) = c( 'SerializedFunction', 'WSDLGeneratedSOAPFunction' )

get_genes_by_enzyme = 
function (enzyme_id, org, server = new("HTTPSOAPServer", host = "soap.genome.jp", 
    port = NA_integer_, url = "/keggapi/request_v4.1.cgi"), .convert = new("ArrayType", 
    dims = NA_integer_, elementType = "xsd:string", elType = new("PrimitiveSOAPType", 
        fromConverter = function () 
        NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
        abstract = logical(0), name = "string", ns = "xsd", nsuri = "http://www.w3.org/2001/XMLSchema", 
        Rname = character(0), documentation = character(0)), 
    fromConverter = function () 
    NULL, toConverter = function () 
    NULL, count = numeric(0), abstract = logical(0), name = "ArrayOfstring", 
    ns = character(0), nsuri = "SOAP/KEGG", Rname = character(0), 
    documentation = character(0)), .opts = list(), nameSpaces = "1.2", 
    .soapHeader = NULL) 
{
    .SOAP(server, "get_genes_by_enzyme", enzyme_id = as.character(enzyme_id), 
        org = as.character(org), action = "SOAP/KEGG#get_genes_by_enzyme", 
        xmlns = "SOAP/KEGG", .types = list(enzyme_id = new("PrimitiveSOAPType", 
            fromConverter = function () 
            NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
            abstract = logical(0), name = "string", ns = "xsd", 
            nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
            documentation = character(0)), org = new("PrimitiveSOAPType", 
            fromConverter = function () 
            NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
            abstract = logical(0), name = "string", ns = "xsd", 
            nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
            documentation = character(0))), .convert = .convert, 
        .header = c(Accept = "text/xml", Accept = "multipart/*", 
            `Content-Type` = "text/xml; charset=utf-8", SOAPAction = "\"SOAP/KEGG#get_genes_by_enzyme\""), 
        .opts = .opts, nameSpaces = nameSpaces, .elementFormQualified = TRUE, 
        .returnNodeName = "return", .soapHeader = .soapHeader)
}

class( get_genes_by_enzyme ) = c( 'SerializedFunction', 'WSDLGeneratedSOAPFunction' )

get_enzymes_by_gene = 
function (genes_id, server = new("HTTPSOAPServer", host = "soap.genome.jp", 
    port = NA_integer_, url = "/keggapi/request_v4.1.cgi"), .convert = new("ArrayType", 
    dims = NA_integer_, elementType = "xsd:string", elType = new("PrimitiveSOAPType", 
        fromConverter = function () 
        NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
        abstract = logical(0), name = "string", ns = "xsd", nsuri = "http://www.w3.org/2001/XMLSchema", 
        Rname = character(0), documentation = character(0)), 
    fromConverter = function () 
    NULL, toConverter = function () 
    NULL, count = numeric(0), abstract = logical(0), name = "ArrayOfstring", 
    ns = character(0), nsuri = "SOAP/KEGG", Rname = character(0), 
    documentation = character(0)), .opts = list(), nameSpaces = "1.2", 
    .soapHeader = NULL) 
{
    .SOAP(server, "get_enzymes_by_gene", genes_id = as.character(genes_id), 
        action = "SOAP/KEGG#get_enzymes_by_gene", xmlns = "SOAP/KEGG", 
        .types = list(genes_id = new("PrimitiveSOAPType", fromConverter = function () 
        NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
            abstract = logical(0), name = "string", ns = "xsd", 
            nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
            documentation = character(0))), .convert = .convert, 
        .header = c(Accept = "text/xml", Accept = "multipart/*", 
            `Content-Type` = "text/xml; charset=utf-8", SOAPAction = "\"SOAP/KEGG#get_enzymes_by_gene\""), 
        .opts = .opts, nameSpaces = nameSpaces, .elementFormQualified = TRUE, 
        .returnNodeName = "return", .soapHeader = .soapHeader)
}

class( get_enzymes_by_gene ) = c( 'SerializedFunction', 'WSDLGeneratedSOAPFunction' )

get_enzymes_by_reaction = 
function (reaction_id, server = new("HTTPSOAPServer", host = "soap.genome.jp", 
    port = NA_integer_, url = "/keggapi/request_v4.1.cgi"), .convert = new("ArrayType", 
    dims = NA_integer_, elementType = "xsd:string", elType = new("PrimitiveSOAPType", 
        fromConverter = function () 
        NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
        abstract = logical(0), name = "string", ns = "xsd", nsuri = "http://www.w3.org/2001/XMLSchema", 
        Rname = character(0), documentation = character(0)), 
    fromConverter = function () 
    NULL, toConverter = function () 
    NULL, count = numeric(0), abstract = logical(0), name = "ArrayOfstring", 
    ns = character(0), nsuri = "SOAP/KEGG", Rname = character(0), 
    documentation = character(0)), .opts = list(), nameSpaces = "1.2", 
    .soapHeader = NULL) 
{
    .SOAP(server, "get_enzymes_by_reaction", reaction_id = as.character(reaction_id), 
        action = "SOAP/KEGG#get_enzymes_by_reaction", xmlns = "SOAP/KEGG", 
        .types = list(reaction_id = new("PrimitiveSOAPType", 
            fromConverter = function () 
            NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
            abstract = logical(0), name = "string", ns = "xsd", 
            nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
            documentation = character(0))), .convert = .convert, 
        .header = c(Accept = "text/xml", Accept = "multipart/*", 
            `Content-Type` = "text/xml; charset=utf-8", SOAPAction = "\"SOAP/KEGG#get_enzymes_by_reaction\""), 
        .opts = .opts, nameSpaces = nameSpaces, .elementFormQualified = TRUE, 
        .returnNodeName = "return", .soapHeader = .soapHeader)
}

class( get_enzymes_by_reaction ) = c( 'SerializedFunction', 'WSDLGeneratedSOAPFunction' )

get_reactions_by_enzyme = 
function (enzyme_id, server = new("HTTPSOAPServer", host = "soap.genome.jp", 
    port = NA_integer_, url = "/keggapi/request_v4.1.cgi"), .convert = new("ArrayType", 
    dims = NA_integer_, elementType = "xsd:string", elType = new("PrimitiveSOAPType", 
        fromConverter = function () 
        NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
        abstract = logical(0), name = "string", ns = "xsd", nsuri = "http://www.w3.org/2001/XMLSchema", 
        Rname = character(0), documentation = character(0)), 
    fromConverter = function () 
    NULL, toConverter = function () 
    NULL, count = numeric(0), abstract = logical(0), name = "ArrayOfstring", 
    ns = character(0), nsuri = "SOAP/KEGG", Rname = character(0), 
    documentation = character(0)), .opts = list(), nameSpaces = "1.2", 
    .soapHeader = NULL) 
{
    .SOAP(server, "get_reactions_by_enzyme", enzyme_id = as.character(enzyme_id), 
        action = "SOAP/KEGG#get_reactions_by_enzyme", xmlns = "SOAP/KEGG", 
        .types = list(enzyme_id = new("PrimitiveSOAPType", fromConverter = function () 
        NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
            abstract = logical(0), name = "string", ns = "xsd", 
            nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
            documentation = character(0))), .convert = .convert, 
        .header = c(Accept = "text/xml", Accept = "multipart/*", 
            `Content-Type` = "text/xml; charset=utf-8", SOAPAction = "\"SOAP/KEGG#get_reactions_by_enzyme\""), 
        .opts = .opts, nameSpaces = nameSpaces, .elementFormQualified = TRUE, 
        .returnNodeName = "return", .soapHeader = .soapHeader)
}

class( get_reactions_by_enzyme ) = c( 'SerializedFunction', 'WSDLGeneratedSOAPFunction' )

get_genes_by_organism = 
function (org, start, max_results, server = new("HTTPSOAPServer", 
    host = "soap.genome.jp", port = NA_integer_, url = "/keggapi/request_v4.1.cgi"), 
    .convert = new("ArrayType", dims = NA_integer_, elementType = "xsd:string", 
        elType = new("PrimitiveSOAPType", fromConverter = function () 
        NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
            abstract = logical(0), name = "string", ns = "xsd", 
            nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
            documentation = character(0)), fromConverter = function () 
        NULL, toConverter = function () 
        NULL, count = numeric(0), abstract = logical(0), name = "ArrayOfstring", 
        ns = character(0), nsuri = "SOAP/KEGG", Rname = character(0), 
        documentation = character(0)), .opts = list(), nameSpaces = "1.2", 
    .soapHeader = NULL) 
{
    .SOAP(server, "get_genes_by_organism", org = as.character(org), 
        start = as.integer(start), max_results = as.integer(max_results), 
        action = "SOAP/KEGG#get_genes_by_organism", xmlns = "SOAP/KEGG", 
        .types = list(org = new("PrimitiveSOAPType", fromConverter = function () 
        NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
            abstract = logical(0), name = "string", ns = "xsd", 
            nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
            documentation = character(0)), start = new("PrimitiveSOAPType", 
            fromConverter = function () 
            NULL, toConverter = .Primitive("as.integer"), count = numeric(0), 
            abstract = logical(0), name = "int", ns = "xsd", 
            nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
            documentation = character(0)), max_results = new("PrimitiveSOAPType", 
            fromConverter = function () 
            NULL, toConverter = .Primitive("as.integer"), count = numeric(0), 
            abstract = logical(0), name = "int", ns = "xsd", 
            nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
            documentation = character(0))), .convert = .convert, 
        .header = c(Accept = "text/xml", Accept = "multipart/*", 
            `Content-Type` = "text/xml; charset=utf-8", SOAPAction = "\"SOAP/KEGG#get_genes_by_organism\""), 
        .opts = .opts, nameSpaces = nameSpaces, .elementFormQualified = TRUE, 
        .returnNodeName = "return", .soapHeader = .soapHeader)
}

class( get_genes_by_organism ) = c( 'SerializedFunction', 'WSDLGeneratedSOAPFunction' )

get_number_of_genes_by_organism = 
function (abbr, server = new("HTTPSOAPServer", host = "soap.genome.jp", 
    port = NA_integer_, url = "/keggapi/request_v4.1.cgi"), .convert = new("PrimitiveSOAPType", 
    fromConverter = function () 
    NULL, toConverter = .Primitive("as.integer"), count = numeric(0), 
    abstract = logical(0), name = "int", ns = "xsd", nsuri = "http://www.w3.org/2001/XMLSchema", 
    Rname = character(0), documentation = character(0)), .opts = list(), 
    nameSpaces = "1.2", .soapHeader = NULL) 
{
    .SOAP(server, "get_number_of_genes_by_organism", abbr = as.character(abbr), 
        action = "SOAP/KEGG#get_number_of_genes_by_organism", 
        xmlns = "SOAP/KEGG", .types = list(abbr = new("PrimitiveSOAPType", 
            fromConverter = function () 
            NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
            abstract = logical(0), name = "string", ns = "xsd", 
            nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
            documentation = character(0))), .convert = .convert, 
        .header = c(Accept = "text/xml", Accept = "multipart/*", 
            `Content-Type` = "text/xml; charset=utf-8", SOAPAction = "\"SOAP/KEGG#get_number_of_genes_by_organism\""), 
        .opts = .opts, nameSpaces = nameSpaces, .elementFormQualified = TRUE, 
        .returnNodeName = "return", .soapHeader = .soapHeader)
}

class( get_number_of_genes_by_organism ) = c( 'SerializedFunction', 'WSDLGeneratedSOAPFunction' )

get_reactions_by_glycan = 
function (glycan_id, server = new("HTTPSOAPServer", host = "soap.genome.jp", 
    port = NA_integer_, url = "/keggapi/request_v4.1.cgi"), .convert = new("ArrayType", 
    dims = NA_integer_, elementType = "xsd:string", elType = new("PrimitiveSOAPType", 
        fromConverter = function () 
        NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
        abstract = logical(0), name = "string", ns = "xsd", nsuri = "http://www.w3.org/2001/XMLSchema", 
        Rname = character(0), documentation = character(0)), 
    fromConverter = function () 
    NULL, toConverter = function () 
    NULL, count = numeric(0), abstract = logical(0), name = "ArrayOfstring", 
    ns = character(0), nsuri = "SOAP/KEGG", Rname = character(0), 
    documentation = character(0)), .opts = list(), nameSpaces = "1.2", 
    .soapHeader = NULL) 
{
    .SOAP(server, "get_reactions_by_glycan", glycan_id = as.character(glycan_id), 
        action = "SOAP/KEGG#get_reactions_by_glycan", xmlns = "SOAP/KEGG", 
        .types = list(glycan_id = new("PrimitiveSOAPType", fromConverter = function () 
        NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
            abstract = logical(0), name = "string", ns = "xsd", 
            nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
            documentation = character(0))), .convert = .convert, 
        .header = c(Accept = "text/xml", Accept = "multipart/*", 
            `Content-Type` = "text/xml; charset=utf-8", SOAPAction = "\"SOAP/KEGG#get_reactions_by_glycan\""), 
        .opts = .opts, nameSpaces = nameSpaces, .elementFormQualified = TRUE, 
        .returnNodeName = "return", .soapHeader = .soapHeader)
}

class( get_reactions_by_glycan ) = c( 'SerializedFunction', 'WSDLGeneratedSOAPFunction' )

get_reactions_by_compound = 
function (compound_id, server = new("HTTPSOAPServer", host = "soap.genome.jp", 
    port = NA_integer_, url = "/keggapi/request_v4.1.cgi"), .convert = new("ArrayType", 
    dims = NA_integer_, elementType = "xsd:string", elType = new("PrimitiveSOAPType", 
        fromConverter = function () 
        NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
        abstract = logical(0), name = "string", ns = "xsd", nsuri = "http://www.w3.org/2001/XMLSchema", 
        Rname = character(0), documentation = character(0)), 
    fromConverter = function () 
    NULL, toConverter = function () 
    NULL, count = numeric(0), abstract = logical(0), name = "ArrayOfstring", 
    ns = character(0), nsuri = "SOAP/KEGG", Rname = character(0), 
    documentation = character(0)), .opts = list(), nameSpaces = "1.2", 
    .soapHeader = NULL) 
{
    .SOAP(server, "get_reactions_by_compound", compound_id = as.character(compound_id), 
        action = "SOAP/KEGG#get_reactions_by_compound", xmlns = "SOAP/KEGG", 
        .types = list(compound_id = new("PrimitiveSOAPType", 
            fromConverter = function () 
            NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
            abstract = logical(0), name = "string", ns = "xsd", 
            nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
            documentation = character(0))), .convert = .convert, 
        .header = c(Accept = "text/xml", Accept = "multipart/*", 
            `Content-Type` = "text/xml; charset=utf-8", SOAPAction = "\"SOAP/KEGG#get_reactions_by_compound\""), 
        .opts = .opts, nameSpaces = nameSpaces, .elementFormQualified = TRUE, 
        .returnNodeName = "return", .soapHeader = .soapHeader)
}

class( get_reactions_by_compound ) = c( 'SerializedFunction', 'WSDLGeneratedSOAPFunction' )

get_enzymes_by_glycan = 
function (glycan_id, server = new("HTTPSOAPServer", host = "soap.genome.jp", 
    port = NA_integer_, url = "/keggapi/request_v4.1.cgi"), .convert = new("ArrayType", 
    dims = NA_integer_, elementType = "xsd:string", elType = new("PrimitiveSOAPType", 
        fromConverter = function () 
        NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
        abstract = logical(0), name = "string", ns = "xsd", nsuri = "http://www.w3.org/2001/XMLSchema", 
        Rname = character(0), documentation = character(0)), 
    fromConverter = function () 
    NULL, toConverter = function () 
    NULL, count = numeric(0), abstract = logical(0), name = "ArrayOfstring", 
    ns = character(0), nsuri = "SOAP/KEGG", Rname = character(0), 
    documentation = character(0)), .opts = list(), nameSpaces = "1.2", 
    .soapHeader = NULL) 
{
    .SOAP(server, "get_enzymes_by_glycan", glycan_id = as.character(glycan_id), 
        action = "SOAP/KEGG#get_enzymes_by_glycan", xmlns = "SOAP/KEGG", 
        .types = list(glycan_id = new("PrimitiveSOAPType", fromConverter = function () 
        NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
            abstract = logical(0), name = "string", ns = "xsd", 
            nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
            documentation = character(0))), .convert = .convert, 
        .header = c(Accept = "text/xml", Accept = "multipart/*", 
            `Content-Type` = "text/xml; charset=utf-8", SOAPAction = "\"SOAP/KEGG#get_enzymes_by_glycan\""), 
        .opts = .opts, nameSpaces = nameSpaces, .elementFormQualified = TRUE, 
        .returnNodeName = "return", .soapHeader = .soapHeader)
}

class( get_enzymes_by_glycan ) = c( 'SerializedFunction', 'WSDLGeneratedSOAPFunction' )

get_enzymes_by_compound = 
function (compound_id, server = new("HTTPSOAPServer", host = "soap.genome.jp", 
    port = NA_integer_, url = "/keggapi/request_v4.1.cgi"), .convert = new("ArrayType", 
    dims = NA_integer_, elementType = "xsd:string", elType = new("PrimitiveSOAPType", 
        fromConverter = function () 
        NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
        abstract = logical(0), name = "string", ns = "xsd", nsuri = "http://www.w3.org/2001/XMLSchema", 
        Rname = character(0), documentation = character(0)), 
    fromConverter = function () 
    NULL, toConverter = function () 
    NULL, count = numeric(0), abstract = logical(0), name = "ArrayOfstring", 
    ns = character(0), nsuri = "SOAP/KEGG", Rname = character(0), 
    documentation = character(0)), .opts = list(), nameSpaces = "1.2", 
    .soapHeader = NULL) 
{
    .SOAP(server, "get_enzymes_by_compound", compound_id = as.character(compound_id), 
        action = "SOAP/KEGG#get_enzymes_by_compound", xmlns = "SOAP/KEGG", 
        .types = list(compound_id = new("PrimitiveSOAPType", 
            fromConverter = function () 
            NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
            abstract = logical(0), name = "string", ns = "xsd", 
            nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
            documentation = character(0))), .convert = .convert, 
        .header = c(Accept = "text/xml", Accept = "multipart/*", 
            `Content-Type` = "text/xml; charset=utf-8", SOAPAction = "\"SOAP/KEGG#get_enzymes_by_compound\""), 
        .opts = .opts, nameSpaces = nameSpaces, .elementFormQualified = TRUE, 
        .returnNodeName = "return", .soapHeader = .soapHeader)
}

class( get_enzymes_by_compound ) = c( 'SerializedFunction', 'WSDLGeneratedSOAPFunction' )

get_pathways_by_compounds = 
function (compound_id_list, server = new("HTTPSOAPServer", host = "soap.genome.jp", 
    port = NA_integer_, url = "/keggapi/request_v4.1.cgi"), .convert = new("ArrayType", 
    dims = NA_integer_, elementType = "xsd:string", elType = new("PrimitiveSOAPType", 
        fromConverter = function () 
        NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
        abstract = logical(0), name = "string", ns = "xsd", nsuri = "http://www.w3.org/2001/XMLSchema", 
        Rname = character(0), documentation = character(0)), 
    fromConverter = function () 
    NULL, toConverter = function () 
    NULL, count = numeric(0), abstract = logical(0), name = "ArrayOfstring", 
    ns = character(0), nsuri = "SOAP/KEGG", Rname = character(0), 
    documentation = character(0)), .opts = list(), nameSpaces = "1.2", 
    .soapHeader = NULL) 
{
    .SOAP(server, "get_pathways_by_compounds", compound_id_list = as.character(compound_id_list), 
        action = "SOAP/KEGG#get_pathways_by_compounds", xmlns = "SOAP/KEGG", 
        .types = list(compound_id_list = new("ArrayType", dims = NA_integer_, 
            elementType = "xsd:string", elType = new("PrimitiveSOAPType", 
                fromConverter = function () 
                NULL, toConverter = .Primitive("as.character"), 
                count = numeric(0), abstract = logical(0), name = "string", 
                ns = "xsd", nsuri = "http://www.w3.org/2001/XMLSchema", 
                Rname = character(0), documentation = character(0)), 
            fromConverter = function () 
            NULL, toConverter = function () 
            NULL, count = numeric(0), abstract = logical(0), 
            name = "ArrayOfstring", ns = character(0), nsuri = "SOAP/KEGG", 
            Rname = character(0), documentation = character(0))), 
        .convert = .convert, .header = c(Accept = "text/xml", 
            Accept = "multipart/*", `Content-Type` = "text/xml; charset=utf-8", 
            SOAPAction = "\"SOAP/KEGG#get_pathways_by_compounds\""), 
        .opts = .opts, nameSpaces = nameSpaces, .elementFormQualified = TRUE, 
        .returnNodeName = "return", .soapHeader = .soapHeader)
}

class( get_pathways_by_compounds ) = c( 'SerializedFunction', 'WSDLGeneratedSOAPFunction' )

get_pathways_by_glycans = 
function (glycan_id_list, server = new("HTTPSOAPServer", host = "soap.genome.jp", 
    port = NA_integer_, url = "/keggapi/request_v4.1.cgi"), .convert = new("ArrayType", 
    dims = NA_integer_, elementType = "xsd:string", elType = new("PrimitiveSOAPType", 
        fromConverter = function () 
        NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
        abstract = logical(0), name = "string", ns = "xsd", nsuri = "http://www.w3.org/2001/XMLSchema", 
        Rname = character(0), documentation = character(0)), 
    fromConverter = function () 
    NULL, toConverter = function () 
    NULL, count = numeric(0), abstract = logical(0), name = "ArrayOfstring", 
    ns = character(0), nsuri = "SOAP/KEGG", Rname = character(0), 
    documentation = character(0)), .opts = list(), nameSpaces = "1.2", 
    .soapHeader = NULL) 
{
    .SOAP(server, "get_pathways_by_glycans", glycan_id_list = as.character(glycan_id_list), 
        action = "SOAP/KEGG#get_pathways_by_glycans", xmlns = "SOAP/KEGG", 
        .types = list(glycan_id_list = new("ArrayType", dims = NA_integer_, 
            elementType = "xsd:string", elType = new("PrimitiveSOAPType", 
                fromConverter = function () 
                NULL, toConverter = .Primitive("as.character"), 
                count = numeric(0), abstract = logical(0), name = "string", 
                ns = "xsd", nsuri = "http://www.w3.org/2001/XMLSchema", 
                Rname = character(0), documentation = character(0)), 
            fromConverter = function () 
            NULL, toConverter = function () 
            NULL, count = numeric(0), abstract = logical(0), 
            name = "ArrayOfstring", ns = character(0), nsuri = "SOAP/KEGG", 
            Rname = character(0), documentation = character(0))), 
        .convert = .convert, .header = c(Accept = "text/xml", 
            Accept = "multipart/*", `Content-Type` = "text/xml; charset=utf-8", 
            SOAPAction = "\"SOAP/KEGG#get_pathways_by_glycans\""), 
        .opts = .opts, nameSpaces = nameSpaces, .elementFormQualified = TRUE, 
        .returnNodeName = "return", .soapHeader = .soapHeader)
}

class( get_pathways_by_glycans ) = c( 'SerializedFunction', 'WSDLGeneratedSOAPFunction' )

get_compounds_by_pathway = 
function (pathway_id, server = new("HTTPSOAPServer", host = "soap.genome.jp", 
    port = NA_integer_, url = "/keggapi/request_v4.1.cgi"), .convert = new("ArrayType", 
    dims = NA_integer_, elementType = "xsd:string", elType = new("PrimitiveSOAPType", 
        fromConverter = function () 
        NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
        abstract = logical(0), name = "string", ns = "xsd", nsuri = "http://www.w3.org/2001/XMLSchema", 
        Rname = character(0), documentation = character(0)), 
    fromConverter = function () 
    NULL, toConverter = function () 
    NULL, count = numeric(0), abstract = logical(0), name = "ArrayOfstring", 
    ns = character(0), nsuri = "SOAP/KEGG", Rname = character(0), 
    documentation = character(0)), .opts = list(), nameSpaces = "1.2", 
    .soapHeader = NULL) 
{
    .SOAP(server, "get_compounds_by_pathway", pathway_id = as.character(pathway_id), 
        action = "SOAP/KEGG#get_compounds_by_pathway", xmlns = "SOAP/KEGG", 
        .types = list(pathway_id = new("PrimitiveSOAPType", fromConverter = function () 
        NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
            abstract = logical(0), name = "string", ns = "xsd", 
            nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
            documentation = character(0))), .convert = .convert, 
        .header = c(Accept = "text/xml", Accept = "multipart/*", 
            `Content-Type` = "text/xml; charset=utf-8", SOAPAction = "\"SOAP/KEGG#get_compounds_by_pathway\""), 
        .opts = .opts, nameSpaces = nameSpaces, .elementFormQualified = TRUE, 
        .returnNodeName = "return", .soapHeader = .soapHeader)
}

class( get_compounds_by_pathway ) = c( 'SerializedFunction', 'WSDLGeneratedSOAPFunction' )

get_glycans_by_pathway = 
function (pathway_id, server = new("HTTPSOAPServer", host = "soap.genome.jp", 
    port = NA_integer_, url = "/keggapi/request_v4.1.cgi"), .convert = new("ArrayType", 
    dims = NA_integer_, elementType = "xsd:string", elType = new("PrimitiveSOAPType", 
        fromConverter = function () 
        NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
        abstract = logical(0), name = "string", ns = "xsd", nsuri = "http://www.w3.org/2001/XMLSchema", 
        Rname = character(0), documentation = character(0)), 
    fromConverter = function () 
    NULL, toConverter = function () 
    NULL, count = numeric(0), abstract = logical(0), name = "ArrayOfstring", 
    ns = character(0), nsuri = "SOAP/KEGG", Rname = character(0), 
    documentation = character(0)), .opts = list(), nameSpaces = "1.2", 
    .soapHeader = NULL) 
{
    .SOAP(server, "get_glycans_by_pathway", pathway_id = as.character(pathway_id), 
        action = "SOAP/KEGG#get_glycans_by_pathway", xmlns = "SOAP/KEGG", 
        .types = list(pathway_id = new("PrimitiveSOAPType", fromConverter = function () 
        NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
            abstract = logical(0), name = "string", ns = "xsd", 
            nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
            documentation = character(0))), .convert = .convert, 
        .header = c(Accept = "text/xml", Accept = "multipart/*", 
            `Content-Type` = "text/xml; charset=utf-8", SOAPAction = "\"SOAP/KEGG#get_glycans_by_pathway\""), 
        .opts = .opts, nameSpaces = nameSpaces, .elementFormQualified = TRUE, 
        .returnNodeName = "return", .soapHeader = .soapHeader)
}

class( get_glycans_by_pathway ) = c( 'SerializedFunction', 'WSDLGeneratedSOAPFunction' )

get_compounds_by_reaction = 
function (reaction_id, server = new("HTTPSOAPServer", host = "soap.genome.jp", 
    port = NA_integer_, url = "/keggapi/request_v4.1.cgi"), .convert = new("ArrayType", 
    dims = NA_integer_, elementType = "xsd:string", elType = new("PrimitiveSOAPType", 
        fromConverter = function () 
        NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
        abstract = logical(0), name = "string", ns = "xsd", nsuri = "http://www.w3.org/2001/XMLSchema", 
        Rname = character(0), documentation = character(0)), 
    fromConverter = function () 
    NULL, toConverter = function () 
    NULL, count = numeric(0), abstract = logical(0), name = "ArrayOfstring", 
    ns = character(0), nsuri = "SOAP/KEGG", Rname = character(0), 
    documentation = character(0)), .opts = list(), nameSpaces = "1.2", 
    .soapHeader = NULL) 
{
    .SOAP(server, "get_compounds_by_reaction", reaction_id = as.character(reaction_id), 
        action = "SOAP/KEGG#get_compounds_by_reaction", xmlns = "SOAP/KEGG", 
        .types = list(reaction_id = new("PrimitiveSOAPType", 
            fromConverter = function () 
            NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
            abstract = logical(0), name = "string", ns = "xsd", 
            nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
            documentation = character(0))), .convert = .convert, 
        .header = c(Accept = "text/xml", Accept = "multipart/*", 
            `Content-Type` = "text/xml; charset=utf-8", SOAPAction = "\"SOAP/KEGG#get_compounds_by_reaction\""), 
        .opts = .opts, nameSpaces = nameSpaces, .elementFormQualified = TRUE, 
        .returnNodeName = "return", .soapHeader = .soapHeader)
}

class( get_compounds_by_reaction ) = c( 'SerializedFunction', 'WSDLGeneratedSOAPFunction' )

get_glycans_by_reaction = 
function (reaction_id, server = new("HTTPSOAPServer", host = "soap.genome.jp", 
    port = NA_integer_, url = "/keggapi/request_v4.1.cgi"), .convert = new("ArrayType", 
    dims = NA_integer_, elementType = "xsd:string", elType = new("PrimitiveSOAPType", 
        fromConverter = function () 
        NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
        abstract = logical(0), name = "string", ns = "xsd", nsuri = "http://www.w3.org/2001/XMLSchema", 
        Rname = character(0), documentation = character(0)), 
    fromConverter = function () 
    NULL, toConverter = function () 
    NULL, count = numeric(0), abstract = logical(0), name = "ArrayOfstring", 
    ns = character(0), nsuri = "SOAP/KEGG", Rname = character(0), 
    documentation = character(0)), .opts = list(), nameSpaces = "1.2", 
    .soapHeader = NULL) 
{
    .SOAP(server, "get_glycans_by_reaction", reaction_id = as.character(reaction_id), 
        action = "SOAP/KEGG#get_glycans_by_reaction", xmlns = "SOAP/KEGG", 
        .types = list(reaction_id = new("PrimitiveSOAPType", 
            fromConverter = function () 
            NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
            abstract = logical(0), name = "string", ns = "xsd", 
            nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
            documentation = character(0))), .convert = .convert, 
        .header = c(Accept = "text/xml", Accept = "multipart/*", 
            `Content-Type` = "text/xml; charset=utf-8", SOAPAction = "\"SOAP/KEGG#get_glycans_by_reaction\""), 
        .opts = .opts, nameSpaces = nameSpaces, .elementFormQualified = TRUE, 
        .returnNodeName = "return", .soapHeader = .soapHeader)
}

class( get_glycans_by_reaction ) = c( 'SerializedFunction', 'WSDLGeneratedSOAPFunction' )

get_compounds_by_enzyme = 
function (enzyme_id, server = new("HTTPSOAPServer", host = "soap.genome.jp", 
    port = NA_integer_, url = "/keggapi/request_v4.1.cgi"), .convert = new("ArrayType", 
    dims = NA_integer_, elementType = "xsd:string", elType = new("PrimitiveSOAPType", 
        fromConverter = function () 
        NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
        abstract = logical(0), name = "string", ns = "xsd", nsuri = "http://www.w3.org/2001/XMLSchema", 
        Rname = character(0), documentation = character(0)), 
    fromConverter = function () 
    NULL, toConverter = function () 
    NULL, count = numeric(0), abstract = logical(0), name = "ArrayOfstring", 
    ns = character(0), nsuri = "SOAP/KEGG", Rname = character(0), 
    documentation = character(0)), .opts = list(), nameSpaces = "1.2", 
    .soapHeader = NULL) 
{
    .SOAP(server, "get_compounds_by_enzyme", enzyme_id = as.character(enzyme_id), 
        action = "SOAP/KEGG#get_compounds_by_enzyme", xmlns = "SOAP/KEGG", 
        .types = list(enzyme_id = new("PrimitiveSOAPType", fromConverter = function () 
        NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
            abstract = logical(0), name = "string", ns = "xsd", 
            nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
            documentation = character(0))), .convert = .convert, 
        .header = c(Accept = "text/xml", Accept = "multipart/*", 
            `Content-Type` = "text/xml; charset=utf-8", SOAPAction = "\"SOAP/KEGG#get_compounds_by_enzyme\""), 
        .opts = .opts, nameSpaces = nameSpaces, .elementFormQualified = TRUE, 
        .returnNodeName = "return", .soapHeader = .soapHeader)
}

class( get_compounds_by_enzyme ) = c( 'SerializedFunction', 'WSDLGeneratedSOAPFunction' )

get_glycans_by_enzyme = 
function (enzyme_id, server = new("HTTPSOAPServer", host = "soap.genome.jp", 
    port = NA_integer_, url = "/keggapi/request_v4.1.cgi"), .convert = new("ArrayType", 
    dims = NA_integer_, elementType = "xsd:string", elType = new("PrimitiveSOAPType", 
        fromConverter = function () 
        NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
        abstract = logical(0), name = "string", ns = "xsd", nsuri = "http://www.w3.org/2001/XMLSchema", 
        Rname = character(0), documentation = character(0)), 
    fromConverter = function () 
    NULL, toConverter = function () 
    NULL, count = numeric(0), abstract = logical(0), name = "ArrayOfstring", 
    ns = character(0), nsuri = "SOAP/KEGG", Rname = character(0), 
    documentation = character(0)), .opts = list(), nameSpaces = "1.2", 
    .soapHeader = NULL) 
{
    .SOAP(server, "get_glycans_by_enzyme", enzyme_id = as.character(enzyme_id), 
        action = "SOAP/KEGG#get_glycans_by_enzyme", xmlns = "SOAP/KEGG", 
        .types = list(enzyme_id = new("PrimitiveSOAPType", fromConverter = function () 
        NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
            abstract = logical(0), name = "string", ns = "xsd", 
            nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
            documentation = character(0))), .convert = .convert, 
        .header = c(Accept = "text/xml", Accept = "multipart/*", 
            `Content-Type` = "text/xml; charset=utf-8", SOAPAction = "\"SOAP/KEGG#get_glycans_by_enzyme\""), 
        .opts = .opts, nameSpaces = nameSpaces, .elementFormQualified = TRUE, 
        .returnNodeName = "return", .soapHeader = .soapHeader)
}

class( get_glycans_by_enzyme ) = c( 'SerializedFunction', 'WSDLGeneratedSOAPFunction' )

convert_mol_to_kcf = 
function (mol_text, server = new("HTTPSOAPServer", host = "soap.genome.jp", 
    port = NA_integer_, url = "/keggapi/request_v4.1.cgi"), .convert = new("PrimitiveSOAPType", 
    fromConverter = function () 
    NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
    abstract = logical(0), name = "string", ns = "xsd", nsuri = "http://www.w3.org/2001/XMLSchema", 
    Rname = character(0), documentation = character(0)), .opts = list(), 
    nameSpaces = "1.2", .soapHeader = NULL) 
{
    .SOAP(server, "convert_mol_to_kcf", mol_text = as.character(mol_text), 
        action = "SOAP/KEGG#convert_mol_to_kcf", xmlns = "SOAP/KEGG", 
        .types = list(mol_text = new("PrimitiveSOAPType", fromConverter = function () 
        NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
            abstract = logical(0), name = "string", ns = "xsd", 
            nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
            documentation = character(0))), .convert = .convert, 
        .header = c(Accept = "text/xml", Accept = "multipart/*", 
            `Content-Type` = "text/xml; charset=utf-8", SOAPAction = "\"SOAP/KEGG#convert_mol_to_kcf\""), 
        .opts = .opts, nameSpaces = nameSpaces, .elementFormQualified = TRUE, 
        .returnNodeName = "return", .soapHeader = .soapHeader)
}

class( convert_mol_to_kcf ) = c( 'SerializedFunction', 'WSDLGeneratedSOAPFunction' )

get_kos_by_pathway = 
function (pathway_id, server = new("HTTPSOAPServer", host = "soap.genome.jp", 
    port = NA_integer_, url = "/keggapi/request_v4.1.cgi"), .convert = new("ArrayType", 
    dims = NA_integer_, elementType = "xsd:string", elType = new("PrimitiveSOAPType", 
        fromConverter = function () 
        NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
        abstract = logical(0), name = "string", ns = "xsd", nsuri = "http://www.w3.org/2001/XMLSchema", 
        Rname = character(0), documentation = character(0)), 
    fromConverter = function () 
    NULL, toConverter = function () 
    NULL, count = numeric(0), abstract = logical(0), name = "ArrayOfstring", 
    ns = character(0), nsuri = "SOAP/KEGG", Rname = character(0), 
    documentation = character(0)), .opts = list(), nameSpaces = "1.2", 
    .soapHeader = NULL) 
{
    .SOAP(server, "get_kos_by_pathway", pathway_id = as.character(pathway_id), 
        action = "SOAP/KEGG#get_kos_by_pathway", xmlns = "SOAP/KEGG", 
        .types = list(pathway_id = new("PrimitiveSOAPType", fromConverter = function () 
        NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
            abstract = logical(0), name = "string", ns = "xsd", 
            nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
            documentation = character(0))), .convert = .convert, 
        .header = c(Accept = "text/xml", Accept = "multipart/*", 
            `Content-Type` = "text/xml; charset=utf-8", SOAPAction = "\"SOAP/KEGG#get_kos_by_pathway\""), 
        .opts = .opts, nameSpaces = nameSpaces, .elementFormQualified = TRUE, 
        .returnNodeName = "return", .soapHeader = .soapHeader)
}

class( get_kos_by_pathway ) = c( 'SerializedFunction', 'WSDLGeneratedSOAPFunction' )

get_pathways_by_kos = 
function (ko_id_list, org, server = new("HTTPSOAPServer", host = "soap.genome.jp", 
    port = NA_integer_, url = "/keggapi/request_v4.1.cgi"), .convert = new("ArrayType", 
    dims = NA_integer_, elementType = "xsd:string", elType = new("PrimitiveSOAPType", 
        fromConverter = function () 
        NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
        abstract = logical(0), name = "string", ns = "xsd", nsuri = "http://www.w3.org/2001/XMLSchema", 
        Rname = character(0), documentation = character(0)), 
    fromConverter = function () 
    NULL, toConverter = function () 
    NULL, count = numeric(0), abstract = logical(0), name = "ArrayOfstring", 
    ns = character(0), nsuri = "SOAP/KEGG", Rname = character(0), 
    documentation = character(0)), .opts = list(), nameSpaces = "1.2", 
    .soapHeader = NULL) 
{
    .SOAP(server, "get_pathways_by_kos", ko_id_list = as.character(ko_id_list), 
        org = as.character(org), action = "SOAP/KEGG#get_pathways_by_kos", 
        xmlns = "SOAP/KEGG", .types = list(ko_id_list = new("ArrayType", 
            dims = NA_integer_, elementType = "xsd:string", elType = new("PrimitiveSOAPType", 
                fromConverter = function () 
                NULL, toConverter = .Primitive("as.character"), 
                count = numeric(0), abstract = logical(0), name = "string", 
                ns = "xsd", nsuri = "http://www.w3.org/2001/XMLSchema", 
                Rname = character(0), documentation = character(0)), 
            fromConverter = function () 
            NULL, toConverter = function () 
            NULL, count = numeric(0), abstract = logical(0), 
            name = "ArrayOfstring", ns = character(0), nsuri = "SOAP/KEGG", 
            Rname = character(0), documentation = character(0)), 
            org = new("PrimitiveSOAPType", fromConverter = function () 
            NULL, toConverter = .Primitive("as.character"), count = numeric(0), 
                abstract = logical(0), name = "string", ns = "xsd", 
                nsuri = "http://www.w3.org/2001/XMLSchema", Rname = character(0), 
                documentation = character(0))), .convert = .convert, 
        .header = c(Accept = "text/xml", Accept = "multipart/*", 
            `Content-Type` = "text/xml; charset=utf-8", SOAPAction = "\"SOAP/KEGG#get_pathways_by_kos\""), 
        .opts = .opts, nameSpaces = nameSpaces, .elementFormQualified = TRUE, 
        .returnNodeName = "return", .soapHeader = .soapHeader)
}

class( get_pathways_by_kos ) = c( 'SerializedFunction', 'WSDLGeneratedSOAPFunction' )

