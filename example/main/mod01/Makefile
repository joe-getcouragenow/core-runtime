# includes
BOILERPLATE_FSPATH=./../../../boilerplate

include $(BOILERPLATE_FSPATH)/core/help.mk
include $(BOILERPLATE_FSPATH)/core/os.mk
include $(BOILERPLATE_FSPATH)/core/gitr.mk
include $(BOILERPLATE_FSPATH)/core/tool.mk
include $(BOILERPLATE_FSPATH)/core/flu.mk
include $(BOILERPLATE_FSPATH)/core/go.mk


## Print all settings
this-print:
	$(MAKE) flu-print
	$(MAKE) go-print
	$(MAKE) tool-print

this-build:
	# does gen and web build, which is enough for CI.
	cd ./client && $(MAKE) this-build



