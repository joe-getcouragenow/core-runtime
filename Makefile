# This make file uses composition to keep things KISS and easy.
# In the boilerpalte make files dont do any includes, because you will create multi permutations of possibilities.


# includes
BOILERPLATE_FSPATH=./boilerplate

include $(BOILERPLATE_FSPATH)/core/help.mk
include $(BOILERPLATE_FSPATH)/core/gitr.mk
include $(BOILERPLATE_FSPATH)/core/tool.mk


## Print all settings
this-print:
	TODO


### BUILD Phase
## Builds all tools
this-tools-build:
	# reach into each ones make and build
	cd tool/dummy && $(MAKE) this-build
	cd tool/protofig/protoc-gen-configdef && $(MAKE) this-build
	cd tool/protofig && $(MAKE) this-build-all

# CI and local call this
## Build everything
this-build:
	@echo -- Root - BUILD: start --
	cd ./tool && $(MAKE) this-build
	cd ./sys-core && $(MAKE) this-build
	cd ./mod-settings && $(MAKE) this-build
	cd ./mod-account && $(MAKE) this-build

	@echo -- Root - BUILD: finish --

this-tools-docker-build:
	docker build -t bs-protofig:latest -f tool/protofig/Dockerfile .

this-tools-docker-example:
	docker run -v $(PWD):/hostvol \
		--rm -it bs-protofig:latest /protofig/bs-protofig \
		-f /hostvol/example/protofig/config.default-winwisely.json \
		-u winwiselyexample -o /hostvol/example/protofig/output

### TEST Phase

# CI and local cal this
## tets all tool and modules
this-test:
	@echo -- Root - BUILD: start --

	cd ./tool && $(MAKE) this-test
	cd ./sys-core && $(MAKE) this-test
	cd ./mod-settings && $(MAKE) this-test
	cd ./mod-account && $(MAKE) this-test

	@echo -- Root - BUILD: finish --


## TAGS AND GIT

## Tags the tools via  git tag
this-tag:
	# tag it
	$(MAKE) gitr-release-tag

# Releases a build
this-release: this-tools-build
	# runs off a tag event or a specified tag
	$(MAKE) gitr-release-push
	


### Dummy

# TODO get this inthe right place !!

## build dummy
build-dummy:
	@echo "building dummy"
	@go run multibuild.go -c $(PWD)/.tmp -o $(PWD)/outputs -f $(PWD)/tool/dummy/versions.json -g $(CUR_GIT_URL)

## clean dummy builds
build-dummy-clean:
	@echo "clean build dummy"
	@rm -rf $(PWD)/outputs $(PWD)/.tmp
