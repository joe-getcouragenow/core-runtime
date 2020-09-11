# includes
BOILERPLATE_FSPATH=./../../../../boilerplate

include $(BOILERPLATE_FSPATH)/core/help.mk
include $(BOILERPLATE_FSPATH)/core/os.mk
include $(BOILERPLATE_FSPATH)/core/gitr.mk
include $(BOILERPLATE_FSPATH)/core/tool.mk
include $(BOILERPLATE_FSPATH)/core/flu.mk
include $(BOILERPLATE_FSPATH)/core/go.mk


override FLU_SAMPLE_NAME = ./
override FLU_LIB_NAME = ./


## Print all settings
this-print:
	$(MAKE) flu-print
	$(MAKE) go-print
	$(MAKE) tool-print

## Gets the tools it needs
this-dep:
	$(MAKE) tool-get

## Generates all code
this-gen:
	$(MAKE) flu-gen
	$(MAKE) flu-gen-lang-all

# Builds all outputs
this-build: this-gen
	$(MAKE) flu-web-build
	# Add Desktop as needed

