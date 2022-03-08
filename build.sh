#!/bin/bash

export VERSION="0.0.7"

rm -rf target
mkdir -p target

env GOOS=darwin GOARCH=arm64 CGO_ENABLED=1 go build -o ./target/oulogin-$VERSION-macos ./kubectl-login.go

mkdir target/darwin
cp ./target/oulogin-$VERSION-macos target/darwin/oulogin
chmod +x target/darwin/oulogin
cp LICENSE target/darwin/
cd target/darwin/
zip oulogin-$VERSION-macos.zip ./oulogin LICENSE
cd ../../
mv target/darwin/oulogin-$VERSION-macos.zip target/
rm -rf target/darwin

export MACOS_SHA256=$(shasum -a 256 ./target/oulogin-$VERSION-macos.zip | awk '{print $1}')


