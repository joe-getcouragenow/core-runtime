# includes
BOILERPLATE_FSPATH=../../boilerplate

include $(BOILERPLATE_FSPATH)/core/help.mk
include $(BOILERPLATE_FSPATH)/core/tool.mk
include $(BOILERPLATE_FSPATH)/core/gitu.mk
include $(BOILERPLATE_FSPATH)/core/go.mk

.PHONY: this-dep

# externals
# external dependencies
override GO_EXT_DEPS = github.com/envoyproxy/protoc-gen-validate
# go build
override GO_FSPATH:=${PWD}
override GO_BUILD_OUT_FSPATH:=${TOOL_PROTOFIG_BIN_FSPATH}

#SUFFIX ?= $(shell git config user.name)
SUFFIX ?= winwisely

# Print
this-print:
	@echo EXTERNAL DEPENDENCIES: ${GO_EXT_DEPS}
	@echo GO_BIN_NAME: ${GO_BUILD_OUT_FSPATH}
	@echo GO_BUILD_OUT_FSPATH: ${GO_BUILD_OUT_FSPATH}

# called by CI..
## build all.
this-build-all: this-dep this-proto-gen
	$(MAKE) go-build
	@echo TOOL_PROTOFIG_BIN_NAME: ${TOOL_PROTOFIG_BIN_NAME}

## Build
this-build: this-proto-gen
	${MAKE} go-build
	which ${TOOL_DUMMY_BIN_NAME}

## Dep
this-dep:
	${MAKE} go-exts-get

## Dep clean
this-dep-clean:
	${MAKE} go-exts-clean

## Tests
this-test:
	@go test -bench=.

### GEN
## Generate protobuf golang & dart code
this-proto-gen: this-proto-clean this-gen-bs this-baseproto-gen
	$(MAKE) this-settingsproto
	protoc -I api/ \
		-I ${GOPATH}/src \
		-I ${GOPATH}/src/github.com/envoyproxy/protoc-gen-validate \
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
		-I ${GOPATH}/src/github.com/envoyproxy/protoc-gen-validate \
		--go_out=":generated/go" \
		--dart_out=":generated/dart" \
		--validate_out="lang=go:generated/go/" \
		api/baseproto.proto

## Generate protobuf golang & dart code
this-settingsproto:
	protoc -I api/ \
		-I ${GOPATH}/src \
		-I ${GOPATH}/src/github.com/envoyproxy/protoc-gen-validate \
		--go_out=":generated/go" \
		--dart_out=":generated/dart" \
		--validate_out="lang=go:generated/go/" \
		api/settings.proto


## Test protofig output in output directory using supplied test.json
this-test-json:
	mkdir -p ./output
	go run main.go -f ./test.json -o ./output -u $(SUFFIX)
