
BOILERPLATE_FSPATH=./../../../boilerplate
include $(BOILERPLATE_FSPATH)/core/help.mk
include $(BOILERPLATE_FSPATH)/core/gitr.mk
include $(BOILERPLATE_FSPATH)/core/flu.mk
include $(BOILERPLATE_FSPATH)/core/go.mk

FLU_SAMPLE_NAME=cmd/client/flu

GO_FSPATH=$(PWD)/cmd/client/go

## deps
this-dep:
	go get -u github.com/jackskj/protoc-gen-map

## int the proj
this-init:
	# one time thing
	cd cmd/client/flu && flutter create .

## generate .pb.go and pb.map.go files
this-gen: this-gen-clean
	cd examples && protoc --map_out="sql=./sql:." \
        --go_out="plugins=grpc:."   \
        -I=. \
        ./query.proto
# clean out the generated files		
this-gen-clean:
	rm -rf examples/gen

## RUN

## run server
this-server-run:
	cd cmd/server && go run main.go

## build server
this-server-build:
	cd cmd/server && go build -o $(GOPATH)/bin/bs-protoc-gen-map main.go 

## run flu client
this-flu-run:
	#$(MAKE) flu-desk-init 
	$(MAKE) flu-desk-run 


## run flu client
this-go-run:
	$(MAKE) go-run



