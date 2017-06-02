CWD=$(shell pwd)
GOPATH := $(CWD)

prep:
	if test -d pkg; then rm -rf pkg; fi

rmdeps:
	if test -d src; then rm -rf src; fi 

self:   prep
	if test ! -d src; then mkdir src; fi
	if -d vendor/src; then cp -r vendor/src/* src/; fi

deps:   

vendor-deps: rmdeps deps
	if test ! -d vendor; then mkdir vendor; fi
	if test -d vendor/src; then rm -rf vendor/src; fi
	cp -r src vendor/src
	find vendor -name '.git' -print -type d -exec rm -rf {} +
	rm -rf src

fmt:
	go fmt cmd/*.go

bin:	self
	@GOPATH=$(GOPATH) go build -o bin/ts2str cmd/ts2str.go
