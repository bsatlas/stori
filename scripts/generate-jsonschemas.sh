#!/bin/sh

find schema -path **/test-fixtures -prune -o \
	-name generate.jsonnet -execdir jsonnet -J jsonnet -m . {} \;
