SHELL=/bin/bash

libdep="gopkg.in/yaml.v2" 

all: init get save build test
	@echo make targets init to initialize govendor, get, save, test and build

init: get save

build: 
	go build -a -ldflags '-s'
get:
	govendor get $(libdep)
save:
	govendor sync
test: 
	go test -v

