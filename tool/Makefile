# This make file uses composition to keep things KISS and easy.
# In the boilerpalte make files dont do any includes, because you will create multi permutations of possibilities.


# includes
BOILERPLATE_FSPATH=../../boilerplate

include $(BOILERPLATE_FSPATH)/core/help.mk
include $(BOILERPLATE_FSPATH)/core/gitr.mk
include $(BOILERPLATE_FSPATH)/core/go.mk

.PHONY: help

## Print all settings
this-print:
	$(MAKE) go-print

### BUILD Phase

## Build all tools
this-build:

	@echo -- TOOLS - BUILD ALL: start --

	cd ./dummy && $(MAKE) this-build
	cd ./lang && $(MAKE) this-build
	cd ./protofig && $(MAKE) this-build
	# -- PLUS ALL OTHER TOOLS !!

	@echo -- TOOLS - BUILD ALL: finish --

### TEST Phase

## Test all tools
this-test:
	@echo -- TOOLS - TEST ALL: start --

	#cd ./dummy && $(MAKE) this-test
	#cd ./lang && $(MAKE) this-test
	#cd ./protofig && $(MAKE) this-test
	# -- PLUS ALL OTHER TOOLS !!

	@echo -- TOOLS - TEST ALL: finish --