#include <wsdlparser/WsdlParser.h>

use namespace WsdlPull;

int 
main(int argc, char *argv[])
{
    char *uri;
    if(argc > 1)
        uri = argv[1];
    else 
        uri = "~/eBaySvc.wsdl.xml;

    WsdlParser parser(uri);

    while(parser.getNextElement() != Parser.END) ;

     
}

