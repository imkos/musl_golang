#!/bin/sh
echo "set GO111MODULE on"
export GO111MODULE=on
export GOPROXY=https://goproxy.io
echo "go build ..."
if [ "$1" == "1" ]; then
echo "build for arm..."
CGO_ENABLED=1 GOOS=linux GOARCH=arm CC=arm-linux-gnueabihf-musl-gcc -tags=nomsgpack,noproto,novalidator,fts5 -ldflags '-s -w -extldflags "-static"' .
elif [ "$1" == "2" ]; then
echo "build for arm64..."
CGO_ENABLED=1 GOOS=linux GOARCH=arm64 CC=aarch64-linux-musl-gcc go build -tags=nomsgpack,noproto,novalidator,fts5 -ldflags '-s -w -extldflags "-static"' .
elif [ "$1" == "3" ]; then
echo "build for linux_amd64..."
CGO_ENABLED=1 CC=gcc GOOS=linux GOARCH=amd64 go build -tags=nomsgpack,noproto,novalidator,fts5 -ldflags '-s -w'
elif [ "$1" == "4" ]; then
echo "build for win_amd64..."
#x86_64-w64-mingw32-cross.tgz
CGO_ENABLED=1 GOOS=windows GOARCH=amd64 CC=x86_64-w64-mingw32-gcc go build -tags=nomsgpack,noproto,novalidator,fts5 -ldflags '-s -w'
elif [ "$1" == "5" ]; then
echo "build for win_x86..."
#i686-w64-mingw32-cross.tgz
CGO_ENABLED=1 GOOS=windows GOARCH=386 CC=i686-w64-mingw32-gcc go build -tags=nomsgpack,noproto,novalidator,fts5 -ldflags '-s -w'
elif [ "$1" == "6" ]; then
echo "build for darwin_amd64..."
CGO_ENABLED=0 GOOS=darwin GOARCH=amd64 go build -tags=nomsgpack,noproto,novalidator -ldflags '-s -w'
else
echo "build for linux_amd64..."
CGO_ENABLED=1 CC=musl-gcc GOOS=linux go build -tags=nomsgpack,noproto,novalidator,fts5 -ldflags '-s -w -extldflags "-static"' .
fi
echo "set GO111MODULE off"
export GO111MODULE=off
export GOPROXY=
