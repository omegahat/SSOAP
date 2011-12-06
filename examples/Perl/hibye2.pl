#!/usr/bin/perl

  use SOAP::Lite;

  print SOAP::Lite
    -> proxy('http://services.soaplite.com/hibye.cgi')
    -> uri('http://www.soaplite.com/Demo')
    -> hi()
    -> result;
