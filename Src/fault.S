SOAPFault <-
function(node)
{
 faultClassNames <- c("Client"="SOAPClientFault",
                      "Server"="SOAPServerFault",
                      "MustUnderstand" = "SOAPMustUnderstandFault",
                      "VersionMismatch" = "SOAPVersionMismatchFault")        
  
 if(is.character(node)) {
   node <- parseSOAP(node)
 }
  
 code <- xmlValue(node[["faultcode"]])
 els <- strsplit(code, ":")[[1]]
   # Check that the namespace of the fault is appropriate for us to look
   # for a built-in fault.
  els[1] <- toupper(els[1])

  if(els[1] != "SOAP" && els[1] != "SOAP-ENV")
    code <- NULL
  else
    code <- els[2]

 if(!is.null(code) && !is.na(match(code, names(faultClassNames)))) {
  className <- faultClassNames[[code]]
 } else
  className <- "SOAPGeneralFault"
 
 f <- new(className)

 f@message <- xmlValue(node[["faultstring"]])

 if(!is.null(node[["actor"]]))
   f@actor <- xmlValue(node[["actor"]]) 

 f@detail <- node[["detail"]]

 
 f
}  

