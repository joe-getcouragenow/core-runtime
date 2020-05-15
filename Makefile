# This make file uses composition to keep things KISS and easy.
# In the boilerpalte make files dont do any includes, because you will create multi permutations of possibilities.


# includes
BOILERPLATE_FSPATH=./boilerplate

include $(BOILERPLATE_FSPATH)/core/help.mk
include $(BOILERPLATE_FSPATH)/core/gitr.mk
include $(BOILERPLATE_FSPATH)/core/go.mk

CUR_GIT_URL = "https://github.com/winwisely268/core-runtime"

.PHONY: help

## Print all settings
this-print:
	$(MAKE) go-print

### Tools
# These make targets do the releases for us.
# They can also be called by CI itself. When it gets a tag it will call the make this-tools-release

## Builds all tools
this-tools-build:
	# reach into each ones make and build
	cd tool/dummy && $(MAKE) this-build
	cd tool/protofig && $(MAKE) this-build


## Tags the tools via  git tag
this-tools-tag:
	# tag it
	$(MAKE) gitr-release-tag

# Releases a build
this-tools-release: this-tools-build
	# runs off a tag event or a specified tag
	$(MAKE) gitr-release-push
	
### Dummy

## build dummy
build-dummy:
	@echo "building dummy"
	@go run multibuild.go -c $(PWD)/.tmp -o $(PWD)/outputs -f $(PWD)/tool/dummy/versions.json -g $(CUR_GIT_URL)

## clean dummy builds
build-dummy-clean:
	@echo "clean build dummy"
	@rm -rf $(PWD)/outputs $(PWD)/.tmp
