FROM docker.io/library/golang:1.14-buster as protofig_builder
ENV CGO_ENABLED 0
RUN mkdir -p /core-runtime
COPY  . /core-runtime
WORKDIR /core-runtime
RUN ls /core-runtime

# GET DEPENDENCIES
RUN apt update
RUN apt install -y libprotobuf-dev make git
RUN cd / && git clone https://github.com/flutter/flutter.git -b beta
RUN export GOPATH=/go
RUN export PATH="$PATH:$GOPATH/bin:/flutter/bin"
RUN go get -u -v google.golang.org/protobuf/cmd/protoc-gen-go
RUN flutter pub global activate protoc_plugin
RUN cd /core-runtime/tool/protofig/protoc-gen-configdef && make this-build
RUN cd /core-runtime/tool/protofig/ && make this-dep
RUN cd /core-runtime/tool/protofig && make this-build
RUN echo $GOPATH

# BUILD DOCKER / PODMAN IMAGE
#FROM docker.io/library/alpine:3.11
#COPY --from=protofig_builder /core-runtime/
#COPY --from=app_builder /stok/ssl/le/tls.crt /stok/ssl/
#COPY --from=app_builder /stok/ssl/le/tls.key /stok/ssl/
#COPY --from=app_builder /stok/statik /stok/
#COPY --from=app_builder /stok/${PACKAGE_NAME} /stok/main
##COPY --from=app_builder /stok/etc/firebaseAccount.json /stok/etc/firebase.json
#COPY --from=app_builder /stok/etc/${PACKAGE_NAME}/envFile.prod \
#    /stok/etc/envFile
#WORKDIR /stok
#RUN ls /stok/ssl
#EXPOSE PORT_RPC
#EXPOSE PORT_REST
#CMD /stok/main -c /stok/etc/envFile

LABEL org.opencontainers.image.created="${BUILD_DATE}" \
    org.opencontainers.image.title="${PACKAGE_NAME}" \
    org.opencontainers.image.authors="getcouragenow" \
    org.opencontainers.image.revision="${VCS_REF}" \
    org.opencontainers.image.vendor="getcouragenow"
