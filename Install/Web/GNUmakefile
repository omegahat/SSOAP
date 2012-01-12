
VERSION_INFO=../VersionInfo
OMEGA_HOME=../../../..


include $(OMEGA_HOME)/Config/GNUmakefile.SWebPackageConfig
include $(OMEGA_HOME)/R/Config/RPackageWebConfig


CSS_FILES=$(OMEGA_HOME)/Docs/OmegaTech.css

FAQ=../FAQ.html

CHANGES=../../Changes.html
AUX_DOCS=$(BUGS) $(TODO) $(FAQ) $(CHANGES)

OTHER_DOCS=pkg/man.pdf 
# ../INSTALL.html ../README.html pkg/man.pdf

PKG_TAR_FILE=../../$(TAR_FILE)

pkg/man: $(PKG_TAR_FILE)
	if [ ! -d pkg ] ; then mkdir pkg  ; fi
	(cd  pkg ; tar zxvf ../$(PKG_TAR_FILE) )

install: pkg/$(PKG_NAME)/inst/Docs index.html examples pkg/man.pdf
	scp -r index.html examples  $(OTHER_DOCS) pkg/$(PKG_NAME)/inst/Docs $(CSS_FILES) $(AUX_DOCS) $(PKG_TAR_FILE) $(TARGET_DIR)
	$(update-r-mirror)


aux docs: $(AUX_DOCS) index.html
	scp $^ $(TARGET_DIR)

include $(OMEGA_HOME)/Config/GNUmakefile.SWebPackageRules

