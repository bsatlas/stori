#!/bin/sh

find . -path ./jsonnet -prune -o \
	-path '**/test-fixtures/**' -name generate.jsonnet \
	-execdir jsonnet -J jsonnet -m . {} \;
