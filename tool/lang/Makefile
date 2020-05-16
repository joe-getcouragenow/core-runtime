
# includes
BOILERPLATE_FSPATH=./../../boilerplate

include $(BOILERPLATE_FSPATH)/core/help.mk
include $(BOILERPLATE_FSPATH)/core/tool.mk
include $(BOILERPLATE_FSPATH)/core/go.mk


# go build
override GO_FSPATH:=${PWD}
override GO_BUILD_OUT_ALL_FSPATH=${PWD}/builds
override GO_BIN_NAME=${TOOL_LANG_BIN_NAME}
override GO_BUILD_OUT_FSPATH:=${TOOL_LANG_BIN_FSPATH}

# Print
this-print:
	@echo
	@echo -- TOOL LANG --
	@echo GO_BUILD_OUT_FSPATH: 		${GO_BUILD_OUT_FSPATH}
	@echo GO_BUILD_OUT_ALL_FSPATH: 	${GO_BUILD_OUT_ALL_FSPATH}
	@echo TOOL_LANG_BIN_NAME 		${TOOL_LANG_BIN_NAME}
	@echo

## Build
this-build: this-build-clean
	$(MAKE) go-build 
	which ${TOOL_LANG_BIN_NAME}

this-build-clean:
	rm -rf ${TOOL_LANG_BIN_NAME}

## Build all platforms
this-build-all: this-build-clean-all
	$(MAKE) go-build-all

this-build-clean-all:
	$(MAKE) go-build-clean-all

this-test:
	go test -v ./...

	@echo TODO - call flutter tests !!

# lang tool usage. TODO
# 1. make this-build ==> build lang tool
# 2. make lang-full-json-flutter ==> generate translated json files
# 3. make lang-arb-flutter ==> convert json to arb

## Example json
this-example-json-flutter:
	# generate full json files
	## DOES NOT WORK !!
	${TOOL_LANG_BIN_NAME} flutter --dir examples/lang_example/lib/lang/generated/ --template examples/lang_example/lib/lang/generated/intl_messages.arb --prefix mockText --languages en,fr,es,ur -f

## Example arb
this-example-arb-flutter:
	# ??
	## DOES NOT WORK !!!
	${TOOL_LANG_BIN_NAME} flutter --dir examples/lang_example/lib/lang/generated/
