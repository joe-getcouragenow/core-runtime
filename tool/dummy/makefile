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
	@echo
	@echo -- TOOL DUMMY --
	@echo GO_BUILD_OUT_FSPATH: ${GO_BUILD_OUT_FSPATH}
	@echo TOOL_DUMMY_BIN_NAME ${TOOL_DUMMY_BIN_NAME}
	@echo

## Build
this-build: this-build-clean
	$(MAKE) go-build
	which ${TOOL_DUMMY_BIN_NAME}

this-build-clean:
	rm -rf ${TOOL_DUMMY_BIN_NAME}

this-test:
	@echo TODO !
