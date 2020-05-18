# tool

## protobuf and grpc tools

Which golang protobuf lib to use ?

github.com/golang/protobuf

Why ?

See: https://github.com/protocolbuffers/protobuf-go/releases/tag/v1.20.0#v1.20-grpc-support
The v1.20 protoc-gen-go does not support generating gRPC service definitions.
In the future, gRPC service generation will be supported by a new protoc-gen-go-grpc plugin provided by the Go gRPC project.

The github.com/golang/protobuf version of protoc-gen-go continues to support gRPC and will continue to do so for the foreseeable future.