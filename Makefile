SHELL=/bin/bash

libdep="gopkg.in/yaml.v2" 

all: init get save build test
	@echo make targets init to initialize godeps, get, save, test and build
build: 
	PATH=${GOPATH}/bin:${PATH} GO15VENDOREXPERIMENT=1 GOPATH=${GOPATH} godep go build -a -ldflags '-s'

init: get save

get:
	PATH=${GOPATH}/bin:${PATH} GO15VENDOREXPERIMENT=1 GOPATH=${GOPATH} godep get $(libdep)
save:
	PATH=${GOPATH}/bin:${PATH} GO15VENDOREXPERIMENT=1 GOPATH=${GOPATH} godep save
test: 
	PATH=${GOPATH}/bin:${PATH} GO15VENDOREXPERIMENT=1 GOPATH=${GOPATH} godep go test -v

