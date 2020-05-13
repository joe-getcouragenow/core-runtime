# This make file uses composition to keep things KISS and easy.
# In the boilerpalte make files dont do any includes, because you will create multi permutations of possibilities.

# includes
include ./boilerplate/core/help.mk
include ./boilerplate/core/go.mk

CUR_GIT_URL = "https://github.com/winwisely268/core-runtime"

.PHONY: help

## Print all settings
this-print:
	$(MAKE) go-print

## build dummy
build-dummy:
	@echo "building dummy"
	@go run multibuild.go -c $(PWD)/.tmp -o $(PWD)/outputs -f $(PWD)/tool/dummy/versions.json -g $(CUR_GIT_URL)

## clean dummy builds
build-dummy-clean:
	@echo "clean build dummy"
	@rm -rf $(PWD)/outputs $(PWD)/.tmp
