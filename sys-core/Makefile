# includes
BOILERPLATE_FSPATH=./../boilerplate

include $(BOILERPLATE_FSPATH)/core/help.mk
include $(BOILERPLATE_FSPATH)/core/os.mk
include $(BOILERPLATE_FSPATH)/core/tool.mk


# NOT needed for v2
#DEP_GEN_FSPATH=./../boilerplate
#DEP_LIB_PROTOGEN=protofig


this-dep:
	# Builds the tools in tools folder
	# Other repos will get them from core-bs.
	cd ../tool && $(MAKE) this-build

this-gen:

	@echo -- GEN ALL: start --

	@echo -- GEN ALL: finish --

	## Generate protobuf golang & dart code
	#cd ../tool/protofig && $(MAKE) this-proto-gen

	#cp ../tool/protofig/generated/dart/baseproto.* client/lib/src/api/
	#cp ../tool/protofig/generated/dart/settings.* client/lib/src/api/
	#cp ../tool/protofig/generated/dart/accounts.* client/lib/src/api/
	


# CI and local call this
## Build everything
this-build: this-dep this-gen

	@echo -- BUILD ALL: start --

	$(MAKE) this-mods-build

	@echo -- BUILD ALL: finish --


this-build-all:
	## TODO: Build all like we do in core-bs


