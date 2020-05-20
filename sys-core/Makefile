# includes
BOILERPLATE_FSPATH=./../boilerplate

include $(BOILERPLATE_FSPATH)/core/help.mk
include $(BOILERPLATE_FSPATH)/core/os.mk
include $(BOILERPLATE_FSPATH)/core/tool.mk



DEP_GEN_FSPATH=./../boilerplate
DEP_LIB_PROTOGEN=protofig


this-dep:
	# go to tool and run make.
	cd ../tool && $(MAKE) this-build


# CI and local call this
## Build everything
this-build: this-dep this-gen

	@echo -- BUILD ALL: start --

	#$(MAKE) this-tools-build
	#$(MAKE) this-mods-build

	@echo -- BUILD ALL: finish --

## this-gen
this-gen:

	@echo -- GEN ALL: start --

	#$(MAKE) this-tools-build
	#$(MAKE) this-mods-build

	@echo -- GEN ALL: finish --


	## Generate protobuf golang & dart code
	#cd ../tool/protofig && $(MAKE) this-proto-gen

	#cp ../tool/protofig/generated/dart/baseproto.* client/lib/src/api/
	#cp ../tool/protofig/generated/dart/settings.* client/lib/src/api/
	#cp ../tool/protofig/generated/dart/accounts.* client/lib/src/api/

this-build-all:
	## TODO: 


