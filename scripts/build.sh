#!/bin/sh

go build \
	-ldflags "-X main.Version=$0 -X main.Commit=$1" \
	-o bin/stori github.com/atlaskerr/stori/cmd/stori
