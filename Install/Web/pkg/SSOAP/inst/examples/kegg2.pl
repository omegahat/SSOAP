#!/usr/bin/env perl

use SOAP::Lite +trace => [qw(debug)];

print "SOAP::Lite = ", $SOAP::Lite::VERSION, "\n";

my $serv = SOAP::Lite -> service("http://soap.genome.jp/KEGG.wsdl");

my $genes = ["eco:b1002", "eco:b2388"];

my $result = $serv->mark_pathway_by_objects("path:eco00010", $genes);
print $result, "\n";

# sub routines implicitly used in the above code

sub SOAP::Serializer::as_ArrayOfstring{
  my ($self, $value, $name, $type, $attr) = @_;
  return [$name, {'xsi:type' => 'array', %$attr}, $value];
}

sub SOAP::Serializer::as_ArrayOfint{
  my ($self, $value, $name, $type, $attr) = @_;
  return [$name, {'xsi:type' => 'array', %$attr}, $value];
}

