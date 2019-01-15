#!/bin/sh

go build \
	-ldflags "-X main.Version=$1 -X main.Commit=$2" \
	-o bin/stori github.com/atlaskerr/stori/cmd/stori
