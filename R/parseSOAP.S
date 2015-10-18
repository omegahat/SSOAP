parseSOAP <-
function(xmlSource, header = FALSE, reduce = TRUE, ..., fullNamespaceInfo = TRUE)
{
   if(inherits(xmlSource, "SOAPHTTPReply")) 
      xmlSource = xmlSource$content

        # was xmlTreeParse
   node <- xmlRoot(xmlParse(xmlSource, ..., fullNamespaceInfo = fullNamespaceInfo))
   if(reduce) {
     if(xmlName(node) == "Envelope") {
       if(xmlSize(node) > 1) {
          node <- node[["Body"]]
       } else
          node <- node[[1]]
     }

     if(xmlName(node) == "Body")
       node <- node[[1]]
   }

   node
}
