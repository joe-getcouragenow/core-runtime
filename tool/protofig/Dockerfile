FROM docker.io/library/golang:1.14-buster as protofig_builder
ENV CGO_ENABLED 0
RUN mkdir -p /core-runtime
COPY . /core-runtime
WORKDIR /core-runtime
RUN ls /core-runtime

# GET DEPENDENCIES
RUN apt update
RUN apt install -y protobuf-compiler libprotobuf-dev make git wget curl tar unzip xz-utils tree
RUN mkdir -p /flutter && cd / && wget -O /flutter/flutter.tar.xz https://storage.googleapis.com/flutter_infra/releases/beta/linux/flutter_linux_1.18.0-11.1.pre-beta.tar.xz
RUN cd /flutter && tar -xvf flutter.tar.xz
RUN mkdir -p /go/{bin,src} && export GOPATH=/go
RUN export PATH="$PATH:$HOME/.pub/cache/bin:$GOPATH/bin:/flutter/flutter/bin:/flutter/flutter/bin/cache/dart-sdk/bin"
RUN go get -u -v google.golang.org/protobuf/cmd/protoc-gen-go && which protoc-gen-go
RUN /flutter/flutter/bin/cache/dart-sdk/bin/pub global activate protoc_plugin
RUN cd /core-runtime/tool/protofig/protoc-gen-configdef && make this-build
RUN cd /core-runtime/tool/protofig/ && make this-dep
RUN cd /core-runtime/tool/protofig && make this-build
RUN echo $GOPATH

# BUILD DOCKER / PODMAN IMAGE
FROM docker.io/library/buster:3.11
COPY --from=protofig_builder /go/bin/protofig /protofig/protofig
WORKDIR /protofig
CMD /protofig/protofig

LABEL org.opencontainers.image.created="${BUILD_DATE}" \
    org.opencontainers.image.title="${PACKAGE_NAME}" \
    org.opencontainers.image.authors="getcouragenow" \
    org.opencontainers.image.revision="${VCS_REF}" \
    org.opencontainers.image.vendor="getcouragenow"
