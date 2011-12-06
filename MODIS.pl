#!/usr/local/activeperl/bin/perl
#!/usr/bin/perl 

################
# ORNL DAAC MODIS Web service - Perl client
#################
##Using SOAP LITE module
use SOAP::Lite  +trace => 'debug';

#SOAP web service connection
$params= SOAP::Lite
    -> service('http://daac.ornl.gov/cgi-bin/MODIS/GLBVIZ_1_Glb_subset/MODIS_webservice.wsdl')
    -> xmlschema('http://www.w3.org/2001/XMLSchema')
    -> getsubset(40,-100,MOD11A2,LST_Day_1km,A2002001,A2002031,10,10);

#Printing the data

   while( my($key, $value) = each %$params ) 
   	{
   		if($key ne 'subset')
			{
			print "$key : $value\n";
			}
   		else
   			{
   			@subset=$value;
   			print "$key :\n";
			for (my $i = 0; $i < @subset; $i++) 
			{
    			for (my $j = 0; $j < @{$subset[$i]}; $j++) { print  "$subset[$i][$j]";}
			}

   	}
   }	



