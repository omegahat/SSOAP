ifdef ADMIN
 include Install/GNUmakefile.admin
endif

ifndef XDYN_DOCS
 XDYN_DOCS=$(HOME)/Classes/StatComputing/XDynDocs/inst
endif

TODO_XSL=$(XDYN_DOCS)/XSL/OmegahatXSL/Todo.xsl

Todo.html: Todo.xml $(TODO_XSL)
	xsltproc --xinclude -o $@ $(TODO_XSL) $<
	   