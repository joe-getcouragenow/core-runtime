# includes
BOILERPLATE_FSPATH=./../../boilerplate

include $(BOILERPLATE_FSPATH)/core/help.mk
include $(BOILERPLATE_FSPATH)/core/go.mk

GO_FSPATH=$(PWD)
GO_BUILD_OUT_FSPATH=$(GOPATH)/bin/bs-dummy
this-build:
	$(MAKE) go-build 
	which $(GO_BUILD_OUT_FSPATH)