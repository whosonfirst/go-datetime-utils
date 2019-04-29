CWD=$(shell pwd)
GOPATH := $(CWD)

prep:
	if test -d pkg; then rm -rf pkg; fi

rmdeps:
	if test -d src; then rm -rf src; fi 

self:   prep
	if test ! -d src; then mkdir src; fi
	if test -d vendor; then cp -r vendor/* src/; fi

deps:   

vendor-deps: rmdeps deps
	if test ! -d vendor; then mkdir vendor; fi
	if test -d vendor; then rm -rf vendor; fi
	if test -d src; then cp -r src vendor; fi
	if test -d vendor; then find vendor -name '.git' -print -type d -exec rm -rf {} +; fi
	if test -d src; then rm -rf src; fi

fmt:
	go fmt cmd/*.go

bin:	self
	@GOPATH=$(GOPATH) go build -o bin/ts2str cmd/ts2str.go
	@GOPATH=$(GOPATH) go build -o bin/str2ts cmd/str2ts.go
