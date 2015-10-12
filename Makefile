SHELL=/bin/bash
export PATH=${GOPATH}/bin:${PATH}
libdep="gopkg.in/yaml.v2" 

all: init get save build test
	@echo make targets init to initialize godeps, get, save, test and build
build: 
	GO15VENDOREXPERIMENT=1 GOPATH=${GOPATH} godep go build -a -ldflags '-s'

init: get save

get:
	GO15VENDOREXPERIMENT=1 GOPATH=${GOPATH} godep get $(libdep)
save:
	GO15VENDOREXPERIMENT=1 GOPATH=${GOPATH} godep save
test: 
	GO15VENDOREXPERIMENT=1 GOPATH=${GOPATH} godep go test -v

