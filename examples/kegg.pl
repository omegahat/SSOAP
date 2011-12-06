#!/usr/bin/perl

use SOAP::Lite;
use SOAP::Lite +trace =>
    all;
$wsdl = 'http://soap.genome.ad.jp/KEGG.wsdl';

$serv = SOAP::Lite->service($wsdl);

# Result for next data is empty vector.
#$genes = SOAP::Data->type(array => ['eco:b0116', 'eco:b0077']);
# So call with something that gives us a good answer.
$genes = SOAP::Data->type(array => ['eco:b0077' , 'eco:b0078']);
$els = $serv->get_pathways_by_genes($genes);
#$els = $serv->get_pathways_by_genes(['eco:b0077' , 'eco:b0078']);
print join(', ', @{$els}), "\n";



#$f = $serv->get_neighbors_by_gene('eco:b0002', 'all', 11, 10);
#print "get_neighbors_by_gene ", $f, "\n";

$g = $serv->get_reverse_best_neighbors_by_gene('eco:b0002', 11, 10);
print "Count: ", $#{$g}, "\n";
print $g;
die 0;

$g = $serv->bfind("gb E-cadherin human");

print $g, "\n";
die 0;


$g = $serv->get_paralogs_by_gene("eco:b0002", 1, 10);
print "Count: ", $#{$g}, "\n";
foreach $hit (@{$g}) {
  print "$hit->{path}\t$hit->{type}\t$hit->{entry_id1}\t$hit->{entry_id2}\n";
}

$g = $serv->get_best_neighbors_by_gene("eco:b0002", 1, 5);
foreach $hit (@{$g}) {
  print "$hit->{genes_id1}\t$hit->{genes_id2}\t$hit->{sw_score}\n";
}


die 0;


$g = $serv->get_genes_by_pathway("path:eco00020");
print "get_genes_by_pathway ", join(', ', @{$g}), "\n";

die 0;


$g = $serv->get_all_genes_by_organism("sce"); #, 1, 5);
print "get_genes_by_oganism ", join(', ', @{$g}), "\n";

print "get_pathways_by_genes\n";

$genes = SOAP::Data->type(array => ['eco:b0077' , 'eco:b0078']);
#$els = $serv->get_pathways_by_genes($genes);

$genes = SOAP::Data->type(array => ["ec:1.3.99.1"]);
$els = $serv->get_pathways_by_enzymes($genes);

print join(', ', @{$els}), "\n";

print "Done\n";

$start = 1;
$max_results = 5;

$top5 = $serv->get_best_neighbors_by_gene('eco:b0002', $start, $max_results);

foreach $hit (@{$top5}) {
  print "$hit->{genes_id1}\t$hit->{genes_id2}\t$hit->{sw_score}\n";
}
