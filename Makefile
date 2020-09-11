# This make file uses composition to keep things KISS and easy.
# In the boilerpalte make files dont do any includes, because you will create multi permutations of possibilities.


# includes
BOILERPLATE_FSPATH=./boilerplate

include $(BOILERPLATE_FSPATH)/core/help.mk
include $(BOILERPLATE_FSPATH)/core/gitr.mk
include $(BOILERPLATE_FSPATH)/core/tool.mk
include $(BOILERPLATE_FSPATH)/core/go.mk

#override GO_EXT_DEPS = github.com/git-chglog/git-chglog/cmd/git-chglog

## Print all settings
this-print:
	$(MAKE) go-print

this-flu-activate-plugin:
	# TODO move down to tools obviously.
	pub global activate protoc_plugin


### BUILD Phase

# CI and local call this
## Build everything
this-build:
	@echo -- Root - BUILD: start --
	cd ./tool && $(MAKE) this-build
	cd ./sys-core && $(MAKE) this-build

	# Below are commented out because Packages does not need the modules below yet.
	#cd ./mod-settings && $(MAKE) this-build
	#cd ./mod-account && $(MAKE) this-build
	#cd ./example/main/maintemplate && $(MAKE) this-build

	@echo -- Root - BUILD: finish --



### TEST Phase

# CI and local call this
## Tests all tool and modules
this-test:
	@echo -- Root - BUILD: start --

	cd ./tool && $(MAKE) this-test
	cd ./sys-core && $(MAKE) this-test

	# Below are commented out because Packages does not need the modules below yet.
	#cd ./mod-settings && $(MAKE) this-test
	#cd ./mod-account && $(MAKE) this-test

	@echo -- Root - BUILD: finish --


## TAGS AND GIT

# TODO: Move this to a .mk file so all Repos can use it.

## Tags the tools via git, example: VERSION="YOUR_TAG" make this-tag
this-tag: this-deps
	# tag it
	$(MAKE) gitr-release-tag

# Releases a build
this-release: this-tools-build
	# runs off a tag event or a specified tag
	$(MAKE) gitr-release-push

# Releases all builds
this-release-all: this-tools-build-all
	${MAKE} gitr-release-push
	
## Install external dependencies for tagging
this-deps:
	# install git-chglog
	$(MAKE) go-exts-get

## Cleans external dependencies for tagging
this-deps-clean:
	$(MAKE) go-exts-clean


### OTHER


this-tools-build:
	# reach into each ones make and build
	cd tool/dummy && $(MAKE) this-build
	cd tool/protofig/protoc-gen-configdef && $(MAKE) this-build
	cd tool/protofig && $(MAKE) this-build

this-tools-build-all:
	# go to tool and run Makefile from there
	cd tool && ${MAKE} this-assets-release

this-tools-docker-build:
	docker build -t bs-protofig:latest -f tool/protofig/Dockerfile .

this-tools-docker-example:
	docker run -v $(PWD):/hostvol \
		--rm -it bs-protofig:latest /protofig/bs-protofig \
		-f /hostvol/example/protofig/config.default-winwisely.json \
		-u winwiselyexample -o /hostvol/example/protofig/output
