#!/bin/sh

#COMMIT= $(if $(git status --porcelain --untracked-files=no) then "${COMMIT_NO}-dirty" else "${COMMIT_NO}")
VERSION=`cat ./VERSION`
SHA=`git rev-parse HEAD 2> /dev/null || true`
DIRTY=`git status --porcelain --untracked-files=no`

if [ "$DIRTY" ]
then
	COMMIT="$SHA-dirty"
else
	COMMIT="$SHA"
fi


build() {
	go build \
	-ldflags "-X main.Version=$1 -X main.Commit=$2" \
	-o bin/stori github.com/atlaskerr/stori/cmd/stori
}

build $VERSION $COMMIT
