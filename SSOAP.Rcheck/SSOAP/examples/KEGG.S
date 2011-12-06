# See
#    http://www.genome.jp/kegg/soap/doc/keggapi_manual.html
#    http://www.genome.jp/kegg/docs/keggapi_manual.html
# for examples and results.

# From KEGGSOAP
# "getBestNeighbors"   -   wrapper for get_best_neighbors_by_gene and get_best_best...

# Working from the
library(SSOAP)
kegg = processWSDL("http://soap.genome.jp/KEGG.wsdl")
ki = iface = genSOAPClientInterface(def = kegg)

#kegg = processWSDL("examples/KEGG.wsdl")

# options(UseDashInSOAPNames = "TRUE")
#ki = iface = genSOAPClientInterface(def = kegg)



# Get the databases and then all their version information.
db = ki@functions$list_databases()
length(db)
table(sapply(db, class))
db[[1]]

#library(RCurl)
#h = getCurlHandle()
v = sapply(sapply(db, function(x) x@entry_id), ki@functions$binfo)

tmp = ki@functions$list_organisms()
organisms = structure(sapply(tmp, function(x) x$definition),
                      names = sapply(tmp, function(x) x$entry_id))


m = ki@functions$list_pathways("map")
length(m)
table(sapply(m, class))
m[[1]]

iface@functions$binfo("gb")

iface@functions$btit("hsa:1798 mmu:13478 dme:CG5287-PA cel:Y60A3A.14")
iface@functions$bfind("gb E-cadherin human")

# The next 4 calls gave Null Dec 5, 2005. (Same with perl for the last one at least.
# Didn't check the others.).
# The first is no longer in the WSDL file. I would expect an error, but we get NULL.
# Of course, if using the correct WSDL, the function won't be generated.
# And with the new WSDL, the remaining 3 operations work fine.
if(FALSE)
 iface@functions$get_neighbors_by_gene('eco:b0002', 'all', 11, 10)

# Works now
iface@functions[["get_best_neighbors_by_gene"]]('eco:b0002', 1, 5)

iface@functions[["get_best_best_neighbors_by_gene"]]('eco:b0002', 11, 10)

iface@functions$get_reverse_best_neighbors_by_gene('eco:b0002', 11, 10)


# This returns an ArrayOfDefinition which is
# a complex type that is simply an Array whose element
# type is Definition.
iface@functions[["list_pathways"]]('eco')


iface@functions[["get_motifs_by_gene"]]('eco:b0002', 'pfam')




# bget and bfind are not behaving as per the examples on
#   http://www.genome.jp/kegg/soap/doc/keggapi_manual.html#label:22
#


# List of Definition objects.
iface@functions[["list_organisms"]]()

# List of Definition objects.
iface@functions[["list_databases"]]()

iface@functions$get_compounds_by_enzyme('ec:2.7.1.12')
iface@functions$get_compounds_by_reaction('rn:R00100')

iface@functions$get_glycans_by_enzyme('ec:2.4.1.141')
iface@functions$get_glycans_by_reaction('rn:R06164')

iface@functions[[ "get_compounds_by_pathway" ]]('path:eco00020')
iface@functions[[ "get_genes_by_pathway" ]]('path:eco00020')
iface@functions[[ "get_enzymes_by_pathway" ]]('path:eco00020')
iface@functions[[ "get_reactions_by_pathway" ]]('path:eco00020')

iface@functions[[ "get_drugs_by_pathway" ]]('path:eco00020')
iface@functions[[ "get_glycans_by_pathway" ]]('path:eco00510')

iface@functions[[ "get_kos_by_pathway" ]]('path:hsa00010')


iface@functions$search_compounds_by_mass(174.05, 0.1)


# Array of Definition objects.
iface@functions[["get_genes_by_motifs"]](c('pf:DnaJ', 'ps:DNAJ_2'), 1, 10)


iface@functions[["get_genes_by_organism"]]("hin", 1, 10)
iface@functions$get_number_of_genes_by_organism('eco')


iface@functions$get_reactions_by_compound('cpd:C00199')

                                       # List with one string.
iface@functions$get_reactions_by_enzyme('ec:2.7.1.12')
iface@functions$get_compounds_by_reaction('rn:R00100')
iface@functions$get_compounds_by_enzyme('ec:2.7.1.12')
iface@functions$get_enzymes_by_reaction('rn:R00100')
iface@functions$get_enzymes_by_compound('cpd:C00345')
iface@functions$get_enzymes_by_glycan('gl:G00001')

iface@functions$get_enzymes_by_gene('eco:b0002')


# Note that this is is enzymes (with an S) in the example in the manual
# (not in the documentation within the manual, just the example).
# It gives a zero-length array of strings with ec:1.2.1.1
# but 4 elements for ec:1.1.1.1.
# This tests the handling of PrimitiveSOAPType objects in fromSOAPArray
# (as do all of the ArrayOfstring methods)
iface@functions$get_genes_by_enzyme('ec:1.1.1.1', 'eco')

iface@functions$get_linked_pathways('path:eco00620')


# Array of LinkDBRelation objects.
iface@functions[["get_linkdb_by_entry"]]('eco:b0002', 'pathway', 1, 10)

iface@functions$get_linkdb_between_databases("eco", "pathway", 1, 100)


# List of SSDBRelation.
# Gives me NULL now. (Dec. 5, 2005). But not with the new WSDL, or a new call.
# So does kegg.pl via SOAP::Lite.  
iface@functions[["get_paralogs_by_gene"]]("eco:b0002", 1, 10)


iface@functions$get_number_of_genes_by_organism('eco')

iface@functions$get_genes_by_enzyme('ec:1.2.1.1', 'eco')

# Not in WSDL.
if(FALSE) {
iface@functions$get_pc_members_by_gene('eco:b0002', 1, 10)
iface@functions$get_oc_members_by_gene('eco:b0002', 1, 10)
iface@functions$get_ko_members('ko:K02598')
}
iface@functions$get_ko_by_gene('eco:b0002')
iface@functions$get_ko_by_ko_class('01196')
iface@functions$get_genes_by_ko_class('00903', 'hsa' , 1, 100)
iface@functions$get_genes_by_ko('ko:K00010', 'all')


iface@functions$bconv("ncbi-gi:10047086 ncbi-gi:10047090 ncbi-geneid:14751")
iface@functions$bget("-f -n a eco:b0002")
iface@functions$btit("hsa:1798 mmu:13478 dme:CG5287-PA cel:Y60A3A.14")
#XXX This one has hung on me in the past. Fine now.
# Returns a string of length 8991 (currently). Somewhat slow in SOAP::Lite.
# Mar 24, 07:  And a delay  in R again, but works. 
#
iface@functions$bfind("gb E-cadherin human")
# Return a string.
iface@functions$binfo("gb")
iface@functions[["binfo"]]('all')




# Conversion hits a NULL XMLNode.
# Looks like we aren't dealing with the correct node, but the top-level part
# of the return e.g. <get_similarity_between_genesResponse><return>....
# rather than the child of <return>
# Works now by ensuring that parsing and finding the return node is in the
# convertFromSOAP method.
#FIX:
# No longer in the WSDL.
#iface@functions[['get_similarity_between_genes']]('eco:b0002', 'eco:b3940')


#############################################################################################################################
# PROBLEMS:
############# These all look like issues with arrays.
# And all of them seem to be fixed now.
# Need the 1.1 namespaces, i.e. 1999 schema.


# Okay now. Aug 29 2011
iface@functions[["get_genes_by_motifs"]](c('pf:DnaJ', 'ps:DNAJ_2'), 1, 10)



# Throws an HTML server error.
# The problem was that the arrays had a new line between the <item> and the value
# e.g.
# <item xsi:type="xsd:string">
# eco:b0077
# </item><item xsi:type="xsd:string">
# eco:b0078
# </item>
#
#
iface@functions[[ "get_pathways_by_genes" ]](c('eco:b0077' , 'eco:b0078'))
iface@functions$get_pathways_by_genes(c('eco:b0077' , 'eco:b0078'))


# This used to give me NULL.
# The issue was the way we were representing arrays (with newlines between the <item> and value).
iface@functions[["mark_pathway_by_objects"]]("path:eco00010", c("eco:b1002", "eco:b2388"))


iface@functions$get_pathways_by_compounds(c('cpd:C00033', 'cpd:C00158'))

iface@functions$get_pathways_by_drugs(c('dr:D00204', 'dr:D01053'))

# Get an answer but it is a SOAP array with 0 elements. Not anymore!
iface@functions$get_pathways_by_reactions(c('rn:R00959', 'rn:R02740', 'rn:R00960', 'rn:R01786'))



# Same as get_pathways_by_reactions.
iface@functions$get_pathways_by_compounds(c('cpd:C00033', 'cpd:C00158'))


# Same....
img = iface@functions$color_pathway_by_objects('path:eco00260', c('eco:b0514', 'eco:b2913'), c('#ff0000', '#00ff00'), c('#ffff00', 'yellow'))
gif = getURL(img)



iface@functions[[ "get_pathways_by_enzymes" ]](c('ec:1.3.99.1', "ec:2.3.1.61"))

# For this, we need to convert the argument to an array not a scalar.
iface@functions[[ "get_pathways_by_enzymes" ]](c('ec:1.3.99.1'))





################################################
# Needs work.
################################################



# Tests the coercion from numeric to integer of element_id_list.

element_id_list = c(78, 79, 51, 47)
fg_list  = c( '#ff0000', '#0000ff', '#ff0000', '#0000ff')
bg_list  = c( '#ffff00', '#ffff00', '#ffcc00', '#ffcc00' )
iface@functions$get_html_of_colored_pathway_by_elements('path:bsu00010', element_id_list, fg_list, bg_list)

iface@functions$get_html_of_colored_pathway_by_objects('path:bsu00010', element_id_list, fg_list, bg_list)


element_id_list = c( 78, 79, 51, 47 )
fg_list  = c( '#ff0000', '#0000ff', '#ff0000', '#0000ff')
bg_list  = c( '#ffff00', '#ffff00', '#ffcc00', '#ffcc00')
iface@functions$color_pathway_by_elements('path:bsu00010', element_id_list, fg_list, bg_list)


iface@functions$get_references_by_pathway("path:map00010")


# Add a converter for reading the HTML and identifying the gif file.


mol = iface@functions$bget("-f m cpd:C00111")
iface@functions$search_compounds_by_subcomp(mol, 1, 5)
# list()

kcf = iface@functions$bget("-f k gl:G12922")
iface@functions$search_glycans_by_kcam(kcf, "gapped", "local", 1, 5)



# Was causing problems because each element in the resulting array/list
# was a complex object which was an S4 object of class PathwayElementRelation
# and that has a slot name subtypes of class ArrayOfSubtype.
# But fromSOAPArray() was returning it as a "list" and not of the more specific
# extended class ArrayOfSubtype. Fixed now.
iface@functions$get_element_relations_by_pathway('path:bsu00010')


######################
#
# Not working
#
# infinite recursion in the conversion of the result.

iface@functions$get_elements_by_pathway('path:bsu00010')

setAs("character", "ArrayOfstring", function(from) new("ArrayOfstring", from))

iface@functions$get_elements_by_pathway('path:bsu00010')


# our own converters

PathwayElement =
function(node)
{
   obj = new("PathwayElement")
   obj@element_id = as.integer(xmlValue(node[["element_id"]]))
   obj@type = xmlValue(node[["type"]])
   obj@NAMES = new("ArrayOfstring", xmlSApply(node[["names"]], xmlValue))
   obj@components = new("ArrayOfint", as.integer(xmlSApply(node[["components"]], xmlValue))   )
   obj
}

ArrayOfPathwayElement =
function(node)
{
  tmp = xmlApply(node, PathwayElement)
  new("ArrayOfPathwayElement", tmp)
}  

iface@functions$get_elements_by_pathway('path:bsu00010', .convert = ArrayOfPathwayElement)


# By defining the  coercion methods from an abstract XML nodeas

setAs("XMLAbstractNode", "PathwayElement", 
function(from, header = NULL)
{
   obj = new("PathwayElement")
   obj@element_id = as.integer(xmlValue(from[["element_id"]]))
   obj@type = xmlValue(from[["type"]])
   obj@NAMES = new("ArrayOfstring", xmlSApply(from[["names"]], xmlValue))
   obj@components = new("ArrayOfint", as.integer(xmlSApply(from[["components"]], xmlValue)))
   obj
})


setAs("XMLAbstractNode", "ArrayOfPathwayElement", 
function(from, header)
{
  tmp = xmlApply(from, as, "PathwayElement")
  new("ArrayOfPathwayElement", tmp)
})


iface@functions$get_elements_by_pathway('path:bsu00010', .convert = function(node) as(node, "ArrayOfPathwayElement"))



