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

	@echo Dummy
	cd ./dummy && $(MAKE) this-build

	@echo Lang
	cd ./lang && $(MAKE) this-build

	@echo Protofig
	cd ./protofig && $(MAKE) this-build

	@echo Protodb
	cd ./protodb && $(MAKE) this-build
	# -- PLUS ALL OTHER TOOLS !!

	@echo -- TOOLS - BUILD ALL: finish --

### TEST Phase

## Test all tools
this-test:
	@echo -- TOOLS - TEST ALL: start --

	@echo Dummy
	cd ./dummy && $(MAKE) this-test

	@echo Lang
	cd ./lang && $(MAKE) this-test

	@echo Protofig
	cd ./protofig && $(MAKE) this-test

	@echo Protodb
	cd ./protodb && $(MAKE) this-test
	# -- PLUS ALL OTHER TOOLS !!

	@echo -- TOOLS - TEST ALL: finish --