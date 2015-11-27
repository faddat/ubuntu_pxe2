#!/bin/bash
bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
gvm install go1.4
gvm use go1.4
gvm install go1.5
gvm use go1.5 --default
go get github.com/danderson/pixiecore
