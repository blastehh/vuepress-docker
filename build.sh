#!/bin/ash

mkdir -p ~/webhook
curl -sL https://github.com/adnanh/webhook/archive/2.6.8.tar.gz | tar -xvz --strip-components=1 -C ~/webhook
cd ~/webhook
go get -d
git -C ~/go/src/github.com/satori/go.uuid checkout v1.2.0
go build -o /usr/local/bin/webhook