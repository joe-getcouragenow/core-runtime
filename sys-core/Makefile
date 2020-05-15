# includes
BOILERPLATE_FSPATH=./../boilerplate

include $(BOILERPLATE_FSPATH)/core/help.mk
include $(BOILERPLATE_FSPATH)/core/os.mk

## Generate protobuf golang & dart code
flu-proto-gen: 
	cd ../tool/protofig && $(MAKE) proto
	cp ../tool/protofig/generated/dart/baseproto.* client/lib/src/api/
	cp ../tool/protofig/generated/dart/settings.* client/lib/src/api/
	cp ../tool/protofig/generated/dart/accounts.* client/lib/src/api/
	
