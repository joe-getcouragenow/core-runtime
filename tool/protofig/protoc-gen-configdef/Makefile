
BOILERPLATE_FSPATH=../../../boilerplate
include ${BOILERPLATE_FSPATH}/core/help.mk
include ${BOILERPLATE_FSPATH}/core/go.mk

override LIB_BIN_NAME=protoc-gen-configdef

override GO_FSPATH:=${PWD}
GO_BUILD_OUT_NAME=protoc-gen-configdef
override GO_BUILD_OUT_FSPATH:=${GOPATH}/bin/${GO_BUILD_OUT_NAME}

.PHONY: help build

this-build:
	${MAKE} go-build
	which ${GO_BUILD_OUT_NAME}

