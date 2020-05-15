# includes
BOILERPLATE_FSPATH=./../../boilerplate

include $(BOILERPLATE_FSPATH)/core/help.mk
include $(BOILERPLATE_FSPATH)/core/tool.mk
include $(BOILERPLATE_FSPATH)/core/go.mk


# go build
override GO_FSPATH:=${PWD}

override GO_BUILD_OUT_FSPATH:=${TOOL_DUMMY_BIN_FSPATH}

# Print
this-print:
	@echo -- TOOL DUMMY --
	@echo EXT_LIB_ENVOY: ${EXT_LIB_ENVOY}

	@echo GO_BIN_NAME: ${GO_BUILD_OUT_FSPATH}
	@echo GO_BUILD_OUT_FSPATH: ${GO_BUILD_OUT_FSPATH}

	@echo TOOL_DUMMY_BIN_NAME ${TOOL_DUMMY_BIN_NAME}

## Build
this-build:
	$(MAKE) go-build 
	which ${TOOL_DUMMY_BIN_NAME}









