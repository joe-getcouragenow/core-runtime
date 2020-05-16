# This make file uses composition to keep things KISS and easy.
# In the boilerpalte make files dont do any includes, because you will create multi permutations of possibilities.


# =============================================================================
# includes
# =============================================================================
BOILERPLATE_FSPATH=../boilerplate

include $(BOILERPLATE_FSPATH)/core/help.mk
include $(BOILERPLATE_FSPATH)/core/gitr.mk
include $(BOILERPLATE_FSPATH)/core/go.mk
include $(BOILERPLATE_FSPATH)/core/tool.mk

# =============================================================================
# Overrides
# =============================================================================
ASSET_DIR_TARGET_FSPATH = $(PWD)/assets
ASSET_FILES_FSPATHS = \
	$(PWD)/dummy/builds \
	$(PWD)/lang/builds \
	$(PWD)/protofig/protoc-gen-configdef/builds \
	$(PWD)/protofig/builds
ASSET_SOURCE_FILES = \
	$(foreach D,$(ASSET_FILES_FSPATHS), \
		$(wildcard $(D)/*))
ASSET_TARGET_FILES = \
	$(foreach D,$(ASSET_FILES_FSPATHS), \
		$(patsubst $(D)/%,$(ASSET_DIR_TARGET_FSPATH)/%,$(wildcard $(D)/*)))

.PHONY: help

## Print all settings
this-print:
	$(MAKE) go-print
	$(MAKE) copy-print

# =============================================================================
### BUILD Phase
# =============================================================================
## Build all tools for all platform (CI)
this-build-all:

	@echo -- TOOLS - BUILD ALL PLATFORMS: start --

	@echo Dummy
	cd ./dummy && $(MAKE) this-build-all

	@echo Lang
	cd ./lang && $(MAKE) this-build-all

	@echo protoc-gen-configdef
	cd ./protofig/protoc-gen-configdef && $(MAKE) this-build-all

#	@echo protoc-gen-map
#	cd ./protodb/protoc-gen-map && $(MAKE) this-build-all

	@echo Protofig
	cd ./protofig && $(MAKE) this-build-all

#	@echo Protodb
#	cd ./protodb && $(MAKE) this-build-all

	# -- PLUS ALL OTHER TOOLS !!

	@echo -- TOOLS - BUILD ALL PLATFORMS: finish --

## Build all tools
this-build:

	@echo -- TOOLS - BUILD ALL: start --

	@echo Dummy
	cd ./dummy && $(MAKE) this-build

	@echo Lang
	cd ./lang && $(MAKE) this-build

	@echo protoc-gen-configdef
	cd ./protofig/protoc-gen-configdef && $(MAKE) this-build

	@echo protoc-gen-map
	cd ./protodb/protoc-gen-map && $(MAKE) this-build

	@echo Protofig
	cd ./protofig && $(MAKE) this-build

	@echo Protodb
	cd ./protodb && $(MAKE) this-build
	# -- PLUS ALL OTHER TOOLS !!

	@echo -- TOOLS - BUILD ALL: finish --
# =============================================================================
### TEST Phase
# =============================================================================
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
# =============================================================================
### Release Phase
# =============================================================================

## Copy all binaries to assets path
this-assets-release: this-build-all this-assets-clean
	mkdir $(ASSET_DIR_TARGET_FSPATH)
	$(MAKE) this-copy-all
	$(MAKE) this-gzip-all

this-assets-clean:
	rm -rf $(ASSET_DIR_TARGET_FSPATH)

this-copy-all: $(ASSET_TARGET_FILES)

this-gzip-all:
	gzip $(wildcard $(ASSET_DIR_TARGET_FSPATH)/*)

$(ASSET_DIR_TARGET_FSPATH)/%: $(ASSET_SOURCE_FILES)
	cp -f $< $@

