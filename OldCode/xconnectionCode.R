setMethod("writeSOAPBody", c(con = "connection"),
function(method, ..., xmlns= NULL, con,
          .types = NULL, .soapArgs = list(),
          .literal = FALSE,
          .header = NULL, .elementFormQualified = FALSE)
{
  writeSOAPHeader(.header, con)
  
  # Write the preamble for the SOAP body.
 cat('<SOAP-ENV:Body>\r\n', file=con)

 nsName <- ""

 if(!is.null(xmlns) && !is.null(names(xmlns))) 
   nsName <- paste(names(xmlns)[1], ":", sep="")


  # Output the namespace and the method name
 cat("<", nsName, method, sep="", file=con)  

  # Now announce the namespace attribute
 if(!is.null(xmlns) && xmlns != "") {
   ns <- ""
   if(!is.null(names(xmlns)))
     ns <-  paste(":", names(xmlns)[1], sep="")
   cat(" xmlns", ns,"=\"", xmlns,"\"", file=con, sep="")
 }
 cat(">\n", file=con)

   # Now we are moving onto the parameters for the call.
 args <- list(...)
 args <- merge.list(args, .soapArgs)
 
 argNames <- names(args)

   # Patch up argument names if necessary.
   # If none, make them up as a1, a2, a3,
 if(is.null(argNames)) {
   argNames <- paste("arg", 1:length(args), sep="")
 } else {
     # If there are any missing, add them as arg1, arg2, ...
   which = argNames == ""
   if(any(which))
     argNames[which] <- paste("arg", 1:sum(which), sep="")
 }

 
  # Now write the arguments into the body.
  # Each argument looks like <argName type>value</argName>
 if(length(args) > 0) {
  for(i in 1:length(args)) {
    argName <- argNames[i]

    typedef = NULL
    if(length(.types) >= i ) {
      typedef = .types[[i]]
      type = getSOAPType(.types[[i]], args[[i]])
    } else
      type = getSOAPType(args[[i]])


    if(!.literal) {
       cat("<", argName, " ", sep="", file=con)
       if(length(type) && type[1] != "")
          writeTypes(args[[i]], con = con, types = type)

       cat(">", file=con)
    }
    toSOAP(args[[i]], con, type = typedef, literal = .literal)
    if(!.literal)
       cat("</", argName, ">\r\n", sep="", file=con)  
  }
 }
 cat("</", nsName, method, ">\r\n", sep="", file=con) 

 cat("</SOAP-ENV:Body>\r\n", file=con) 
})

toSOAPNamedContainer <-
function(obj, con = stdout(), type = NULL, ..., .literal = FALSE)
{

   # cat("xsi:type=\"apachens:Map\">", , file = con,)
   for(i in names(obj)) {
     if(is(con, "connection")) {
       cat("<item><key xsi:type=\"xsd:string\">", i, "</key>", file = con, sep = "")
       cat("<value", file = con)
       toSOAP(obj[[i]],  con = con, type = NULL, .literal = .literal)
       cat("</value>", file = con)
     } else {
       tmp = newXMLNode("item", doc = con)
       newXMLNode("key", attrs = c("xsi:type" = 'xsd:string'), i, parent = tmp, doc = con)
       val = newXMLNode("value", parent = tmp, doc = con)
       addChildren(val, toSOAP(obj[[i]], NULL, type = NULL, .literal = .literal) )      
       tmp
     }
   } 

   return(TRUE)
}

