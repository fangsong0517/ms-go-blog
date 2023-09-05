SRCS=$(shell find . \( -path ./test -path -o -path ./tools \) -prune -o -name '*.go' -type f -print)
SERVER_NAME=./bin/ms-go-blog
TIME                    = $(shell date +"%Y%m%d%H%M%S")
PROGRAM=$(SERVER_NAME).$(TIME)
#PROGRAM=$(SERVER_NAME)
VERSION=$(shell git describe --always --long)


.PHONY: all clean show test

all: $(PROGRAM)
$(PROGRAM): $(SRCS)
	GO111MODULE=on go build -o $@ -gcflags "-N -l" -ldflags="-X main._VERSION_=$(VERSION)" *.go
	cp $@ $(SERVER_NAME)

clean:
	rm log -fr

show:
	@echo $(SRCS)

test:
	#go test -v
