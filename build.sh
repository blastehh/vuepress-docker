#!/bin/ash

mkdir -p ~/webhook
curl -sL https://github.com/adnanh/webhook/archive/refs/tags/2.8.0.tar.gz | tar -xvz --strip-components=1 -C ~/webhook
cd ~/webhook
go get -d
go build -o /usr/local/bin/webhook