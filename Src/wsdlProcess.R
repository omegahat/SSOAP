setClass("SOAPClientInterface",
           representation(functions = "list",
                          classes = "list"))

dynamicSOAPServer =
function(iface, obj = new("DynamicSOAPServer"))
{
  server = environment(iface@functions[[1]])$".defaultServer"
  obj@server = server
  obj@functions = iface@functions
  
  obj
}


setMethod("$", c("DynamicSOAPServer") , # "character"),
           function(x, name) {
               f = x@functions[[name]]
                # Need to put this server object as the default server.
                # formals(f)
               f
           })

#setGeneric("names", function(x) standardGeneric("names"))

setMethod("names", "DynamicSOAPServer",
  function(x)
    names(x@functions)
)


makeTopLevelFunctions =
  #
  # assign the functions to an environment
  #
function(funs, where)
{
  mapply(assign, names(funs), funs, MoreArgs = list(envir = where))
}


getOperationFunction =
function(verb)
{
  if(!is.na(verb)) {
     if(verb == "GET")
       return(createHTTPGetOperationDefinition)
     else if(verb == "POST")
       return(function(...) createHTTPGetOperationDefinition(..., POST = TRUE))
   }
  
  createOperationDefinition
}


genSOAPClientInterface =
  #
  # def is from reading the WSDL file
  # name is the prefix for the methods
  # env is where to put the methods.
  #
function(operations = def@operations[[1]],
         def, name = def@name, env = new.env(parent = globalenv()),
         where = globalenv(), server = def@server,
         nameSpaces = def@nameSpaces,
         addSoapHeader = FALSE, verbose = FALSE, force = FALSE,
         putFunctions = FALSE,
         verb = def@verb,
         opFun = getOperationFunction(verb),
         opts = new("CodeGenOpts"),
         collapseSingleComplexParameter = TRUE, ...)
{
   if(missing(where) && is(putFunctions, "environment"))
      where = putFunctions
  
 computeOperations = FALSE
 if(missing(def) && (is(operations, "SOAPServerDescription") 
                     || is(operations, "character")
                     || is(operations, "XMLAbstractNode"))) {
    computeOperations = TRUE
    def = operations
    if(is(operations, "SOAPServerDescription"))
       operations = def@operations[[1]] # NULL
 } 

 if(is.character(def) || is(def, "XMLAbstractNode")) {
    def = processWSDL(def, ...)
    operations = def@operations[[1]]
  }

 
 classes = NULL
 if(!is.null(where)) 
    classes = defineClasses(def@types, where, verbose = verbose, force = force)

 funs = list()
 assign(".defaultServer", server, env)

 for(i in operations) {
   if(verbose)
      cat("Operation", i@name, "\n")

   funs[[convertToSName(i@name)]] = opFun(i, server, def@types, env, nameSpaces, addSoapHeader,
                                           collapseSingleComplexParameter = collapseSingleComplexParameter)
 }


 if(!missing(putFunctions)) {
   if((is.logical(putFunctions) && putFunctions) || is.environment(putFunctions)) {
     if(is.environment(putFunctions))
       where = putFunctions
     makeTopLevelFunctions(funs, where)
   }
 }
 
 ans = new("SOAPClientInterface", functions = funs, classes = as.list(classes))

 invisible(ans)
}


#XXX This should go in XMLSchema.
setGeneric("getElementFormQualified",
             function(x, ...)
               standardGeneric("getElementFormQualified"))

setMethod("getElementFormQualified", "ANY",
             function(x, ...)
                FALSE)

setMethod("getElementFormQualified", "SchemaTypes",
             function(x, ...)
                x@elementFormQualified)


setMethod("getElementFormQualified", "SchemaCollection",
             function(x, ...) {
               if(length(x) == 0)
                 TRUE
               else
                  x[[1]]@elementFormQualified
             })



createOperationDefinition =
function(.operation, .defaultServer, .types, env = globalenv(), nameSpaces = NA, addSoapHeader = FALSE,
          .elementFormQualified = getElementFormQualified(.types),
          collapseSingleComplexParameter = TRUE)
{

if(.operation@name == "list_pathways")  browser() #XX
  
  empty = sapply(.operation@parameters, checkIsEmptyParameter, types = .types, name = .operation@name, namespaceDefs = nameSpaces)
     #XXX resolve the parameter types. Already resolving them in checkIsEmptyParameter. Should
     # avoid second round of resolve()ing.
 .operation@parameters = .operation@parameters[!empty]
 .operation@parameters = lapply(.operation@parameters, resolve, .types)

  collapsedParameter = FALSE  
  if(collapseSingleComplexParameter && length(.operation@parameters) && .operation@numPartElements == 1) {
    p = .operation@parameters[[1]]
    if(is(p, "Element")) {
      collapsedParameter = TRUE
      collapsedType = p@type
      if(is(p@type, "ClassDefinition"))
        .operation@parameters = p@type@slotTypes
      else if(is(p@type, "PrimitiveSchemaType"))
        .operation@parameters = structure(list(p@type), names = p@name)
      else
        collapsedParameter = FALSE
    } else {
      cat("Not collapsing for", .operation@name, "type", class(p), "\n")
 #      browser()
   }
  }
  
 .operation@returnValue = rval = resolve(.operation@returnValue, .types)

 if(!is.null(.operation@header))
   .operation@header$type = resolve(.operation@header$type, .types)

   # Strip the namespace prefix.
 returnClass <- if(rval@name %in% gsub(".*:", "", names(.types)))  rval@name else NA
 fixes = character(2)
 if(!is.na(returnClass)) {
    fixes[1] = "  ans <-\n"
    fixes[2] = paste("\tas(ans, '",  returnClass, "')\n", sep = "")
 }
 
 
 if(.operation@action == "")
     # NULL is not used, so just NULL for placeholder.
   .operation@action[1] = .SOAPAction(.operation@action, .operation@name, NULL, .operation@namespace)

 dotArgs = ""
 if(length(.operation@parameters)) {

  if(collapsedParameter) {
      # leave the coercion of the individual elements until later.
     dotArgs =  paste(sprintf("%s = %s", names(.operation@parameters),
                                   names(.operation@parameters)),
                      collapse = ", ")
     dotArgs = sprintf("as(list(%s), '%s')", dotArgs, collapsedType@name)
  } else {
     values = sapply(names(.operation@parameters),
                     function(x)
                        coerceArgumentCode(x, .operation@parameters[[x]]))
     dotArgs = paste(paste(paste("'", names(.operation@parameters), "'", sep=""),
                                      values, sep = " = "),
                      collapse=",\n\t")
   }

   
   dotArgs = sprintf(".soapArgs = list(%s)", dotArgs)
 }



 if(length(.operation@parameters) == 1 && (is(.operation@parameters[[1]], "ClassDefinition") ||
            is(.operation@parameters[[1]], "Element") && is(.operation@parameters[[1]]@type, "ClassDefinition"))) {

    # create parameters for each of the slots in the class
   params = c(sprintf("%s = list(...)", convertToSName(names(.operation@parameters))), "...")

 } else {
    params = sapply(names(.operation@parameters), convertToSName)
 }


 converter = if(is(.operation@returnValue, "BasicSchemaType") && length(body(.operation@returnValue@fromConverter)) > 1)
                ".operation@returnValue@fromConverter"
             else
                ".operation@returnValue"

 insertSoapHeader = (is.logical(addSoapHeader) && addSoapHeader) || !is.null(addSoapHeader)

 .opts = ", .opts = list(...), ..."
 .opts = ", .opts = list()"

  
 txt = paste("function(",
              paste(c(params,
                      paste("server = .defaultServer, .convert = ", converter, .opts)),
                    collapse=",\n\t "),
                    paste(",\n\t nameSpaces = ", ifelse(is.na(nameSpaces), nameSpaces, simple.dQuote(nameSpaces))),
                    if(insertSoapHeader) ", .soapHeader = NULL",
                    ", .header = SSOAP::getSOAPRequestHeader(.operation@action, .server = server)",   
                    ", curlHandle = RCurl::getCurlHandle()",
                  ")\n{\n",
              fixes[1],
             "\t .SOAP(server, .operation@name, ",
                  "\n\t\t",         dotArgs,
                   if(length(.operation@parameters)) ", " else "",
                  "\n\t\t",         "action = .operation@action, ",
                  "\n\t\t",         "xmlns = .operation@namespace, ",
                  "\n\t\t",         ".types = .operation@parameters, ",
                  "\n\t\t",         ".convert = .convert,",
#                  "\n\t\t",         ".header = .header,",
                  "\n\t\t",         ".opts = .opts ",
                  if(!is.na(.operation@use["input"]) && .operation@use["input"] == "literal") ",\n\t\t .literal = TRUE",
# now in .opts = list(...)
#                ", ...",
                  ", nameSpaces = nameSpaces,",
                  paste(" .elementFormQualified", .elementFormQualified, sep = " = "),
                  sprintf(", .returnNodeName = %s", if(is.na(.operation@returnNodeName)) NA else sQuote(.operation@returnNodeName)),
                  if(insertSoapHeader) ", .soapHeader = .soapHeader",
                  ", .header = .header, curlHandle = curlHandle",
                  ")\n",
                  fixes[2],
                  "\n}", sep="")  
 f = eval(parse(text = changeQuotes(txt)), env = env) 

 if(insertSoapHeader && !is.logical(addSoapHeader))
   formals(f)[[".soapHeader"]] = addSoapHeader
 
 environment(f) <- e <- new.env(parent = env)
 e$.operation <- .operation
   # Why do this here?
 # e$.header <- getSOAPRequestHeader(.operation@action, .server = .defaultServer)

  # The .defaultServer will, by default, be shared across all the functions.
  # So no need to copy it here. But if we can't find it and have it here,
  # then assign it locally to this function.
 if(!is.null(.defaultServer) && !exists(".defaultServer", envir = env))
    e$.defaultServer <- .defaultServer
 
 
 attr(f, "source") <- txt

   # clean up variables that we use to create the function so that they
   # aren't visible in the closure.
 rm(txt)
 rm(dotArgs)
 
 new("WSDLGeneratedSOAPFunction", f)
}



setGeneric("convertFromSOAP",
            function(val, type, nodeName = "return", ...)
                 standardGeneric("convertFromSOAP"))


if(FALSE)
setMethod("fromSOAP", "character",
          function(node, root = NULL, converters = SchemaPrimitiveConverters, append = TRUE,
                    type = NULL, multiRefs = list()) 
          {
            #XXX
            # Want to extract the response and also any multiRef elements.
               root <- parseSOAP(node, asText = TRUE)

               if(xmlName(root) == "Body") {
                 node <- root[[1]]

                 if(length(multiRefs) == 0) {
                   which = xmlSApply(root, function(x) xmlName(x) == "multiRef")
                   multiRefs = root[which]
                   names(multiRefs) = xmlSApply(multiRefs, function(x) xmlGetAttr(x, "id"))
                 }
               } else
                  node <- root

               fromXML(node, root, converters, append, type, multiRefs = multiRefs)
          })



setMethod("convertFromSOAP", "SOAPResult", 
          function(val, type, nodeName = "return", ...) {
            node <- parseSOAP(val@content, asText = TRUE)
            node <- getReturnNode(node, nodeName)

             # Perhaps bring in the code about the "Body" and multiRefs in array.S in XMLSchema now.
             # See above now.
            fromXML(node, type = type)
          })



SOAPServerDescription =
  # Constructor for a SOAPServerDescription object
  # giving the server identity, and the operations and data types.
function(name,  server, operations, types, nameSpaces = NA, verb = NA,
          obj = new("SOAPServerDescription"))
{
 obj@name = name
 obj@server = server
 if(!is.null(operations))
   obj@operations = operations

 if(!is.null(types))
   obj@types = types


 obj@nameSpaces = as(nameSpaces, "character")
 obj@verb = as.character(verb)

 obj
}

processWSDL <-
  #
  # read a WSDL file and generate an R object describing the 
  # Web Service that it details.
  #
  # This gets the collection of operations and their parameters and return 
  # types and collects all the type information. It also creates a
  # SOAPServerDescription object to identify the Web server.
  #
  # Currently only handle one <service> element
  #
  #
  #XXX handlers is not used if we use internal nodes.
  #
function(fileName = "KEGG.wsdl", handlers = WSDLParseHandlers(fileName),
         nameSpaces  = character(), useInternalNodes = TRUE, verbose = FALSE,
         port = 1L, checkCircularTypes = TRUE)
{
  if(!is(fileName, "XMLAbstractDocument")) {
    if(useInternalNodes)
       wsdl = parseSchemaDoc(fileName)
    else
       wsdl = xmlTreeParse(fileName, handlers = handlers,  asTree = TRUE, fullNamespaceInfo = TRUE)
  } else
     wsdl = fileName

  root = xmlRoot(wsdl)

 
    # Get the server/port node we want
  warnMultiServices = missing(port)
  ports = getNodeSet(wsdl, "//w:service/w:port", c( w ="http://schemas.xmlsoap.org/wsdl/"))
  if(missing(port) && length(ports) > 1)
        warning("Ignoring additional <service><port> ... elements")
  
  if(is.character(port)) {
    port = getNodeSet(wsdl, sprintf("//w:service/w:port[@name = '%s']", port), c( w ="http://schemas.xmlsoap.org/wsdl/"))
    if(length(port) == 0)
      stop("No port location with value ", port, " in the WSDL: ", docName(wsdl))
    port = port[[1]]
  } else {
    port = ports[[port]]
  }
  

   # Get the location/identity of the server.
 loc = xmlGetAttr(port[["address"]], "location")
 server = SOAPServer(loc)

   # Now look at the types section and make up a table of all the types.
 types = processTypes(root, verbose = verbose, checkCircularTypes = checkCircularTypes)


  # Now find the methods/functions that are available from this server.
  # These are in the <binding> elements. We should match each one to
  # each <service>. Currently only handle one <service> element
 
# tmp = root[names(root) == "binding"]
# ops = lapply(tmp, processWSDLBindings, root, types)
# names(ops) = sapply(tmp, xmlGetAttr, "name")

    # We match the binding in the port  to the name in the binding node. But we strip the namespace
    # This is empirical. Works for MassBank, MassSpec, metlin, pug_soap.
 tmp = getNodeSet(wsdl, sprintf("//w:binding[@name = '%s']", gsub(".*:", "", xmlGetAttr(port, "binding"))), c( w ="http://schemas.xmlsoap.org/wsdl/"))[[1]]

 if("binding" %in% names(tmp)) 
   verb = xmlGetAttr(tmp[["binding"]], "verb", NA)
 else
    verb = NA
  
    # currently keep this as a list of bindings. But we should just keep one.  
 ops = structure(list( processWSDLBindings(tmp, root, types)),
                  names = xmlGetAttr(port, "name"))


      # Get the xsd elements from our defaults.
 if(missing(nameSpaces)) {
   schemaURIs = sapply(.SOAPDefaultNameSpaces, function(x) x["xsd"])
      # Find out which one corresponds to ours.
   uris = sapply(xmlNamespaceDefinitions(root), function(x) x$uri)
   i = match(uris, schemaURIs)
   nameSpaces = NA
   if(!all(is.na(i)))
     nameSpaces = names(.SOAPDefaultNameSpaces)[ i[!is.na(i)] ]
 }
 
    #  
 SOAPServerDescription(name = xmlGetAttr(port, "name"),
                       server = server,
                       operations = ops, types = types,
                       nameSpaces = as.character(nameSpaces),
                       verb = as.character(verb))

}

processTypes =
function(root, verbose = FALSE, checkCircularTypes = TRUE)
{
   types = processSchemaTypes(root[["types"]], root, verbose = verbose, checkCircularTypes = checkCircularTypes)
   baseURL = dirname(docName(root))
   wImports = xpathApply(root, "//w:import",  namespaces = c(w = "http://schemas.xmlsoap.org/wsdl/"),
                              processWSDLImport, baseURL = baseURL, checkCircularTypes = checkCircularTypes)
   if(length(wImports)) {
      names(wImports) = xpathSApply(root, "//w:import",
                                     namespaces = c(w = "http://schemas.xmlsoap.org/wsdl/"),
                                      xmlGetAttr, "namespace")
     types =  append(types, wImports)
     if(length(types) > 1)
        types = new("SchemaCollection", types)
   }
   
   types
}

processWSDLImport =
function(node, baseURL = "", checkCircularTypes = TRUE, ...)
{
  ns = xmlGetAttr(node, "namespace")
  url = xmlGetAttr(node, "location")
  url = sprintf("%s/%s", baseURL, url)
  readSchema(url, checkCircularTypes = checkCircularTypes, ...)
}

WSDLParseHandlers =
  #
  # Create handlers for reading the WSDL.
  # These handlers discard comments and handle import'ing
  # of referenced schema putting the results back into the
  # tree where the <import> tag was.
  #
function(baseURI, verbose = FALSE, keepSchema = FALSE)
{
  baseURI = dirname(baseURI)
  schema <- list()

  readReferencedSchema =
  function(node) {
          location = xmlGetAttr(node, "schemaLocation", NA)
          if(is.na(location)) {
            warning("skipping ", xmlName(node), " node with no schemaLocation attribute")
            return(NULL)
          }
          
          location = getRelativeURL(location, baseURI)

          if(verbose)
             cat(xmlName(node), "ing", location, "as part of", baseURI, "\n")

          doc = xmlRoot(xmlTreeParse(location, handlers = handlers, asTree = TRUE, fullNamespaceInfo = TRUE))

          ns = xmlGetAttr(node, "namespace", NA)          
          if(is.na(ns) && xmlName(node) == "import")
              warning("schema <import> without a namespace attribute: ", location)
          else if(keepSchema)
              schema[[ns]] <<- doc
          doc
       }

  
  handlers =
    list(comment = function(node) NULL,
         import = readReferencedSchema,
         include = readReferencedSchema,         
         .schema = function() schema)

  handlers
}  




processWSDLBindings =
  #
  # Called with a <binding>...</binding> node.
  #
function(node, doc = NULL, typeDefinitions = list())
{
 els =  node[names(node) == "operation"]

    # Get the type attribute and remove the namespace.
 type = discardNamespace(xmlGetAttr(node, "type"))

    # XPath:  portType[@name = type]
 types = doc[xmlSApply(doc, function(x) xmlName(x) == "portType" && xmlGetAttr(x, "name") == type)]

  if(length(types))
     types = types[[1]]
  else {
     warning("cannot find the portType")
     types = list()
  }

 namespaceDefinitions =  xmlNamespaceDefinitions(doc) # doc$namespaceDefinitions
 # XXX merge with any others for this node.
 
 ops = lapply(els, processWSDLOperation, types, doc, namespaceDefinitions, typeDefinitions)
 names(ops) = sapply(els, xmlGetAttr, "name")
   
 ops  
}

processWSDLOperation =
  #
  # An operation node.
  #
  # types comes from the collection of <portType> elements, not the schema.
  # The schema types are in typeDefinitions
  #
  #XXX ignores namespaces.
  #XXX should also get the documentation if there is any (e.g. see nwis).

  #XXX
function(node, types, doc, namespaceDefinitions = list(), typeDefinitions = list())
{
  name = xmlGetAttr(node, "name")
  
     # Get the operation element within the portType that corresponds to this operation.
     # The default "" shouldn't match anything and so avoid elements that don't have a
     # @name, e.g. <documentation>
  which = xmlSApply(types, function(x) xmlGetAttr(x, "name", "") == name)

  
  portType = types[which][[1]] 
  if(is.null(portType[["input"]])) {
     args = list()
     parts = list()
  } else  {
     input = discardNamespace( xmlGetAttr(portType[["input"]], "message") )
 
     msgs = doc[xmlSApply(doc, function(x) xmlName(x) == "message" && xmlGetAttr(x, "name") == input)]
     msg = msgs[[1]]

     parts = msg[names(msg) == "part"]
     args = lapply(parts,
                     function(x) {
                            el =  xmlGetAttr(x, "type")
                            if(is.null(el)) 
                                el =  xmlGetAttr(x, "element")
                            
                             # For some reason, adding nsuri here causes the genSOAPClientInterface () to fail.
                             # when generating the operation code in the tests/interop.R example. It is most like
                             # an issue. With the nsuri, we get a SOAPTypeReference for the single parameter,
                             # but without it (i.e. the 2nd call below) we get an object of class PrimitiveSchemaType.
                             # We are using the namespace from x, and not the value in the type element, e.g. xsd:string
                             # However, in this example, they are the same.
                             # SOAPType(el, nsuri = xmlNamespace(x), namespaceDefs = namespaceDefinitions)
                            SchemaType(el, namespaceDefs = namespaceDefinitions)                            
                          })
   # need to map the name for an element rather than type. Let's do this in
   # genSOAPClientInterface() for now.
  names(args) = sapply(parts, function(x) {
#                                     el =  xmlGetAttr(x, "element")
                                     xmlGetAttr(x, "name")                                     
#                                    if(is.null(el))
#                                      xmlGetAttr(x, "name")
#                                    else {
#                                      "xxx.dummy"
#                                     }
#                                       resolve(el, typeDefinitions)@name
                                     
                               })

     #XXX We should check to see if any of these are really empty parameters.

       # instead of removing the degenerate/empty parameters, we can also add a default value
       # for the parameter, e.g. new("listOrganisms"). This would allow both calls.
#XXXX   restore later if we want.
#     args = args[ ! sapply(args, checkIsEmptyParameter, types = typeDefinitions, name = name, namespaceDefs = namespaceDefinitions) ]
     
   }

  output = xmlGetAttr(portType[["output"]], "message")
  output = discardNamespace(output) # XXX
  
  msgs = doc[xmlSApply(doc, function(x) xmlName(x) == "message" && xmlGetAttr(x, "name") == output)]
  msg = msgs[[1]]  

 
  returnNodeName = NA
  if(xmlSize(msg)) {
    value = xmlGetAttr(msg[["part"]], "type")
    if(is.null(value)) 
       value = xmlGetAttr(msg[["part"]], "element", NULL)

    returnNodeName = xmlGetAttr(msg[["part"]], "name", NA)
    el = xmlGetAttr(msg[["part"]], "element")
    if(!is.null(el))
      returnNodeName = gsub(".*:", "",el) #XXX want the namespace.
  } else
     value = NULL


  header = node[["input"]][["header"]]
  header = getOperationHeaderDescription(header, doc)

  input.body = node[["input"]][["body"]]
  if(!is.null(input.body))
     namespace = xmlGetAttr(input.body, "namespace",
                              xmlGetAttr(doc, "targetNamespace", ""))
  else
     namespace = ""

  action = xmlGetAttr(node[["operation"]], "soapAction", "")
  if(action == "")
     action = '' # Was '""'
  
  action = SOAPAction(action)

  obj = new("WSDLMethod", name = name, parameters = args,
                          returnValue = SchemaType(value, namespaceDefs = namespaceDefinitions), #, obj = new("SchemaTypeReference")),
                          namespace = namespace,
                          action = action,
                          returnNodeName = as.character(returnNodeName),
                          numPartElements = length(parts))

  obj@bindingStyle = xmlGetAttr(node[["operation"]], "style", as.character(NA))
  obj@use = sapply(c("input", "output"), 
                        function(x) {
                           b = node[[x]][["body"]]
                             # There may not be a body. For example, we may have a
                             #   <mime:multipartRelated> node.
                             # See NCBI's http://www.ebi.ac.uk/webservices/whatizit/ws?wsdl
                           if(!is.null(b))
                              xmlGetAttr(b, "use", as.character(NA))
                           else
                             as.character(NA)
                        })

  obj@header = header

  
   # Deal with case of enclosed within <annotation>
  doc = portType[["documentation"]]
  if(is.null(doc) && !is.null(doc[["annotation"]]))
     doc = doc[["annotation"]][["documentation"]]


  if(!is.null(doc))
    obj@documentation = xmlValue(portType[["documentation"]])

  obj
}


checkIsEmptyParameter =
  #
  # This attempts to determine if the type is really virtual or empty
  # with no slots. The listOrganisms() method in wikipaths
  
function(type, types, name = NA, namespaceDefs = list())
{
   tt = resolve(type, types, namespaces = namespaceDefs)
   if(is(tt, "Element"))
     tt = tt@type

   if(is.null(tt) || (is(tt, "ClassDefinition") && length(tt@slotTypes) == 0) || is(tt, "SchemaVoidType")) {
     return(TRUE)
    }


   FALSE
}


getOperationHeaderDescription =
function(header, doc)
{
  if(is.null(header)) 
    return(NULL)

  ans = NULL
  
  msg = xmlGetAttr(header, "message")
  msg = doc[ xmlSApply(doc, function(x) xmlName(x) == "message" && xmlGetAttr(x, "name") == discardNamespace(msg)) ]
  if(length(msg)) {
       part = xmlGetAttr(header, "part")
       tmp = xmlSApply(msg[[1]], function(x) if(xmlName(x) == "part" && xmlGetAttr(x, "name") == part) xmlGetAttr(x, "element") else character())
       el = unlist(tmp)
       ans = structure(list(type = el, attributes = xmlAttrs(header)), class = "WSDLOperationHeader")
  }

  ans
}
