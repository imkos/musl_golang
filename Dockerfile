FROM golang:1.19-alpine

RUN apk add --no-cache gcc g++ git make

WORKDIR /build

RUN echo 'export PATH=$PATH:/usr/local/go/bin' >> /opt/go.env
RUN echo 'export GOPATH=/opt/gopath' >> /opt/go.env
RUN echo 'export GOPROXY=https://goproxy.cn' >> /opt/go.env

COPY build.sh /opt/build.sh

ENTRYPOINT ["sh","/opt/build.sh"]
