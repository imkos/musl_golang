#!/bin/sh

source /opt/go.env

cd /build/$BUILD_DIR

./gobuild.sh $BUILD_PM
