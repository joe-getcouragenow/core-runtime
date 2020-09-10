# includes
BOILERPLATE_FSPATH=./../../boilerplate

include $(BOILERPLATE_FSPATH)/core/help.mk
include $(BOILERPLATE_FSPATH)/core/os.mk
include $(BOILERPLATE_FSPATH)/core/tool.mk
include $(BOILERPLATE_FSPATH)/core/flu.mk
include $(BOILERPLATE_FSPATH)/core/go.mk
include $(BOILERPLATE_FSPATH)/core/srv.mk

override FLU_SAMPLE_NAME = client
override FLU_LIB_NAME = client

override SERVER_FSPATH=server

# examples of how to override in root make file
override GO_FSPATH = $(PWD)/server/grpc-web/cmd/server
override GO_BUILD_OUT_FSPATH = $(GOPATH)/bin
override GO_BUILD_OUT_ALL_FSPATH = $(PWD)/targets
override BS_ROOT_FSPATH = XXX
override GO_ARCH=go-arch_override
override GO_BIN_NAME=core

## Print all settings
this-print: ## print

	$(MAKE) os-print
	
	$(MAKE) flu-print

	##$(MAKE) lang-print

	$(MAKE) go-print

	##$(MAKE) srv-print

## build
this-build: this-gen

## gen
this-gen:
	@echo $(TOOL_PROTOFIG_BIN_NAME)
	@echo $(TOOL_PROTOFIG_BIN_FSPATH)

	#$(TOOL_PROTOFIG_BIN_NAME)

## This builds everything
this-flu-build: ##
	$(MAKE) flu-gen-lang
	$(MAKE) flu-gen-lang-dart

### GO

## Build this.
this-go-build: #this-statiks
	$(MAKE) go-build

## Build for all arch and platforms
this-go-build-all: #this-statiks
	$(MAKE) go-build-all

## Delete all of the builds
this-go-build-clean-all:
	$(MAKE) go-build-clean-all

## Delete the build.
this-go-build-clean:
	$(MAKE) go-build-clean
	# delete all generated stuff
	rm -rf $(PWD)/statiks

this-statiks:
	go run sdk/cmd/bp/main.go -t $(PWD)/.tmp -o $(PWD)/statiks


