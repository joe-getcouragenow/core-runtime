# includes
BOILERPLATE_FSPATH=./../boilerplate

include $(BOILERPLATE_FSPATH)/core/help.mk
include $(BOILERPLATE_FSPATH)/core/os.mk
include $(BOILERPLATE_FSPATH)/core/tool.mk
include $(BOILERPLATE_FSPATH)/core/flu.mk
include $(BOILERPLATE_FSPATH)/core/go.mk
include $(BOILERPLATE_FSPATH)/core/srv.mk

override FLU_SAMPLE_NAME = client/example
override FLU_LIB_NAME = client

## build
this-build: this-gen

## gen
this-gen:
	@echo $(TOOL_PROTOFIG_BIN_NAME)
	@echo $(TOOL_PROTOFIG_BIN_FSPATH)

	#$(TOOL_PROTOFIG_BIN_NAME)

