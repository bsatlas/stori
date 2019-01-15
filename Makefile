.PHONY: schemas spec generate-openapi validate-openapi build test test-fixtures embed-files

SPEC_DIR = spec
OPENAPI_DIR = openapi
DOCS_DIR = Documentation
SCRIPTS_DIR = scripts
OPENAPI_FILE = $(OPENAPI_DIR)/openapi.json
SCHEMA_DIR = schema
JSONNET_DIR = jsonnet

COMMIT_NO := $(shell git rev-parse HEAD 2> /dev/null || true)
COMMIT := $(if $(shell git status --porcelain --untracked-files=no),"${COMMIT_NO}-dirty","${COMMIT_NO}")

VERSION = $(shell cat ./VERSION)

test: clean test-fixtures schemas embed-files
	go test -cover ./...

coverage:
	go test -coverprofile=coverage.out ./...

build:
	go build \
		-ldflags "-X main.Version=${VERSION} -X main.Commit=${COMMIT}" \
		-o bin/stori github.com/atlaskerr/stori/cmd/stori

clean:
	rm -rf ./bin
	find . -path '**/test-fixtures/**' -name '*.json' -exec rm -f {} \;
	find schema -path 'jsonnetfile.*' -prune -o -name '*.schema.json' -exec rm -f {} \;

# Generate json-schemas.
schemas:
	find schema -path **/test-fixtures -prune -o -name generate.jsonnet -execdir jsonnet -J jsonnet -m . {} \;

embed-files:
	find schema -name gen.go -execdir go generate {} \;

test-fixtures:
	find . -path ./jsonnet -prune -o \
	-path '**/test-fixtures/**' \
		-name generate.jsonnet \
		-execdir jsonnet -J jsonnet -m . {} \;

# Generate and validate OpenAPI specification file.
spec: generate-openapi validate-openapi

# Generate OpenAPI Specification.
generate-openapi:
	jsonnet -J jsonnet -m $(OPENAPI_DIR) $(OPENAPI_DIR)/openapi.jsonnet

# Validate generated OpenAPI specification file.
validate-openapi:
	swagger-cli validate $(OPENAPI_FILE)

update-jsonnet-libs:
	jb update --jsonnetpkg-home=jsonnet
