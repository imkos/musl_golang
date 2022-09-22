#!/bin/sh
echo "set GO111MODULE on"
export GO111MODULE=on
if [ ! -f "go.mod" ]; then
    go mod init
fi
export GOPROXY=https://goproxy.io
echo "go mod tidy ..."
go mod tidy
echo "set GO111MODULE off"
export GO111MODULE=off
export GOPROXY=
