#!/bin/sh

# Remove binaries.
rm -rf ./bin

# Remove generated json files in test-fixtures.
find . -path ./jsonnet -prune -o \
	-path '**/test-fixtures/**' \
	-name '*.json' -exec rm -f {} \;

# Remove generated jsonschemas.
find schema -path 'jsonnetfile.*' -prune -o \
	-name '*.schema.json' -exec rm -f {} \;
