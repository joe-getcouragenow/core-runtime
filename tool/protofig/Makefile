# includes
BOILERPLATE_FSPATH=../../boilerplate

include $(BOILERPLATE_FSPATH)/core/help.mk
include $(BOILERPLATE_FSPATH)/core/gitu.mk
include $(BOILERPLATE_FSPATH)/core/go.mk

# externals

# envoy
#EXT_LIB_ENVOY:= github.com/getcouragenow/protoc-gen-validate
EXT_LIB_ENVOY:= github.com/envoyproxy/protoc-gen-validate

GITU_REPO_SERVER=github.com
#GITU_REPO_ORG=getcouragenow
GITU_REPO_ORG=envoyproxy
GITU_REPO_NAME=protoc-gen-validate
GITU_REPO_BRANCH=master
GITU_REPO_TAG=????
GITU_REPO_OUTROOT_FSPATH=$(GOPATH)/src


# go build
override GO_FSPATH:=${PWD}
GO_BIN_NAME=protofig
override GO_BUILD_OUT_FSPATH:=${GOPATH}/bin/${GO_BIN_NAME}

#SUFFIX ?= $(shell git config user.name)
SUFFIX ?= winwisely

# Print
this-print:
	@echo EXT_LIB_ENVOY: ${EXT_LIB_ENVOY}

	@echo GO_BUILD_OUT_FSPATH: ${GO_BUILD_OUT_FSPATH}

	@echo git-getlibpath: ${MAKE} ${GITU_LIB}
	@echo git-getfspath: ${MAKE} ${GITU_REPO_OUT_FSPATH}

# called by CI..
## build all.
this-build-all: this-dep this-proto-gen

	${MAKE} go-build

## build
this-build: this-proto-gen
	${MAKE} go-build

## Dep
this-dep:
	${MAKE} gitu-clone-master
	cd ${GITU_REPO_OUT_FSPATH} && make build


## Dep clean
this-dep-clean:
	rm -rf ${GITU_REPO_OUT_FSPATH}


### GEN

## Generate protobuf golang & dart code
this-proto-gen: this-proto-clean this-gen-bs this-baseproto-gen
	$(MAKE) this-settingsproto
	protoc -I api/ \
		-I ${GOPATH}/src \
		-I ${GOPATH}/src/${EXT_LIB_ENVOY} \
		--go_out=":generated/go/" \
		--dart_out=":generated/dart/" \
		--validate_out="lang=go:generated/go/" \
		--configdef_out=output_format=go,suffix=$(SUFFIX):"generated/go" \
		--configdef_out=output_format=dart,suffix=$(SUFFIX):"generated/dart" \
		--configdef_out=output_format=json,suffix=$(SUFFIX):"generated/" \
		api/config.proto

## Clean the generated outputs.
this-proto-clean:
	rm -rf generated/go/*
	rm -rf generated/dart/*
	rm -rf generated/*.json

## Bootstrap the FS for generation-
this-gen-bs:
	mkdir -p ./generated
	mkdir -p ./generated/dart
	mkdir -p ./generated/go


## base proto
this-baseproto-gen:
	protoc -I api/ \
		-I ${GOPATH}/src \
		-I ${GOPATH}/src/${EXT_LIB_ENVOY} \
		--go_out=":generated/go" \
		--dart_out=":generated/dart" \
		--validate_out="lang=go:generated/go/" \
		api/baseproto.proto

## Generate protobuf golang & dart code
this-settingsproto:
	protoc -I api/ \
		-I ${GOPATH}/src \
		-I ${GOPATH}/src/${EXT_LIB_ENVOY} \
		--go_out=":generated/go" \
		--dart_out=":generated/dart" \
		--validate_out="lang=go:generated/go/" \
		api/settings.proto



## Test protofig output in output directory using supplied test.json
this-test-json:
	mkdir -p ./output
	go run main.go -f ./test.json -o ./output -u $(SUFFIX)
