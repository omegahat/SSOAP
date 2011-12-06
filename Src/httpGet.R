.SOAPHttpGet =
function(.url, ..., .params = list(...), .convert = TRUE, .opts = list())
{
   if(!("httpheader" %in% names(.opts)))
     .opts[["httpheader"]] =  c("Content-Type" = "application/soap+xml")
   
   ans = if(length(.params)) 
            getForm(.url, .params = .params, .opts = .opts)
          else 
            getURLContent(.url, .opts = .opts)

   if(is(.convert, "GenericSchemaType")) 
      fromXML(xmlRoot(xmlParse(ans, asText = TRUE)), type = .convert)
   else if(is(.convert, "logical") && .convert)
      fromXML(xmlRoot(xmlParse(ans, asText =TRUE)))     
   else
      ans
}



.SOAPHttpPost =
function(.url, ..., .params = list(...), .convert = TRUE, .opts = list(), .style = 'POST')
{
   ans = if(length(.params)) 
            postForm(.url, .params = .params, .opts = .opts, style = .style)
          else 
            getURLContent(.url, .opts = .opts)

   if(is(.convert, "GenericSchemaType")) 
      fromXML(xmlRoot(xmlParse(ans, asText = TRUE)), type = .convert)
   else if(is(.convert, "logical") && .convert)
      fromXML(xmlRoot(xmlParse(ans, asText =TRUE)))     
   else   
      ans
}



createHTTPGetOperationDefinition =
  #
  # Create an R function that implements the SOAP HTTP GET call for the given Web service operation
  #
function(.operation, .server, .types, env = globalenv(), ..., POST = FALSE)
{
     # create an empty function
   f = function() {}
   environment(f) = globalenv()

     # get the resolved parameter types
   rparams = lapply(.operation@parameters, resolve, context = .types)

      # Create the formal argument list for the function via alist()
      # add .url, ... and .convert
   form = rep(alist(x=), length(rparams) + 3)
   names(form) = c(names(rparams), ".url", "...", ".convert")
   form$.url = sprintf("%s/%s", toURL(.server), .operation@name)
   form$.convert = resolve(.operation@returnValue, .types)
       # set the formal parameters and now we have the skeleton.
   formals(f) = form

       # Create the body of the function. 2 cases:
       #  all single scalar values
       #  one or more vector values.

      # Which are vector valued parameters.
   isMulti = sapply(rparams, function(x) is(x, "SimpleSequenceType") || is(x, "ArrayType"))   

       # coercion
   rtypes = sapply(rparams, mapSOAPTypeToS, .types)


    e = quote(c())
    v = quote(.SOAPHttpGet(.params = .params,  .url = .url, .convert = .convert, .opts = list(...)))
    if(is.logical(POST) && POST)
       POST = as.name(".SOAPHttpPost")

    if(is.name(POST))
        v[[1]] = POST

    args = mapply(function(var, rtype, type) {
                      substitute(as(id, tt), list(id = as.name(var), tt = rtype))
                     }, names(rparams), rtypes, rparams, SIMPLIFY = FALSE)

    i = seq(along = args[!isMulti]) + 1L
    e[i] = args[!isMulti]
    names(e)[i] = names(rparams)[!isMulti]

   if(!any(isMulti)) {   
       v[[2]] = e
       body(f) = v       
    } else {

            # otherwise we have one or more multi valued parameters that we need to repeat.
            # so we arrange to replicate those vectors with the name of the variable repeated for each element
            # and then concatenate that with the list of params we are creating.
            # Currently, there is no coercion of the types being done here.
            # We can do this, but we probably want to assign the to intermediate variables
            # so that we only coerce them once.

        ids = names(rparams[isMulti])
        els = lapply(ids, function(var) substitute(structure(id, names = rep(qid, length(id))), list(id = as.name(var), qid = var)))

        e[seq(length(e) + 1, length = length(els))] = els
        init = substitute(.params <- e, list(e = e))
        b = new("{")
        b[ seq(2, length = sum(!isMulti)) ] = mapply(function(var, ex) {
                                                        substitute( var <- val, list(var = as.name(var), val = ex))
                                                      }, names(args)[isMulti], args[isMulti])
        b[[length(b) + 1]] = init
        b[[length(b) + 1]] = v
        body(f) = b
    }

   attr(f, "inputs") = rtypes
   attr(f, "output") = mapSOAPTypeToS(form$.convert, .types)
   
   f
}
