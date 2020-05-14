# git include
include ../boilerplate/core/help.mk
include ../boilerplate/core/os.mk

## Generate protobuf golang & dart code
flu-proto-gen: 
	cd ../tool/protofig && $(MAKE) proto
	cp ../tool/protofig/generated/dart/baseproto.* client/lib/src/api/
	cp ../tool/protofig/generated/dart/settings.* client/lib/src/api/
	
