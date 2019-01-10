.PHONY: schemas spec generate-openapi validate-openapi build test

SPEC_DIR = spec
OPENAPI_DIR = openapi
DOCS_DIR = Documentation
SCRIPTS_DIR = scripts
OPENAPI_FILE = $(DOCS_DIR)/openapi.json
SCHEMA_DIR = schema
JSONNET_DIR = jsonnet

COMMIT_NO := $(shell git rev-parse HEAD 2> /dev/null || true)
COMMIT := $(if $(shell git status --porcelain --untracked-files=no),"${COMMIT_NO}-dirty","${COMMIT_NO}")

VERSION = $(shell cat ./VERSION)

test:
	go test -cover ./...

coverage:
	go test -coverprofile=coverage.out ./...

build:
	go build \
		-ldflags "-X main.Version=${VERSION} -X main.Commit=${COMMIT}" \
		-o bin/stori github.com/atlaskerr/stori/cmd/stori

clean:
	rm -r ./bin

# Generate json-schemas.
schemas:
	jsonnet -m $(SCHEMA_DIR) $(SCRIPTS_DIR)/gen-jsonschemas.jsonnet
	go generate $(SCHEMA_DIR)/gen.go

test-fixtures:
	jsonnet -J $(JSONNET_DIR)/vendor -m $(SCHEMA_DIR)/oci/test-fixtures/image-index $(SCHEMA_DIR)/oci/test-fixtures/image-index/generate.jsonnet
	jsonnet -J $(JSONNET_DIR)/vendor -m $(SCHEMA_DIR)/oci/test-fixtures/image-manifest $(SCHEMA_DIR)/oci/test-fixtures/image-manifest/generate.jsonnet
	jsonnet -J $(JSONNET_DIR)/vendor -m $(SCHEMA_DIR)/oci/test-fixtures/content-descriptor $(SCHEMA_DIR)/oci/test-fixtures/content-descriptor/generate.jsonnet
	jsonnet -J $(JSONNET_DIR)/vendor -m $(SCHEMA_DIR)/oci/test-fixtures/image-config $(SCHEMA_DIR)/oci/test-fixtures/image-config/generate.jsonnet
	jsonnet -J $(JSONNET_DIR)/vendor -m $(SCHEMA_DIR)/oci/test-fixtures/tag-list $(SCHEMA_DIR)/oci/test-fixtures/tag-list/generate.jsonnet
	jsonnet -J $(JSONNET_DIR)/vendor -m $(SCHEMA_DIR)/oci/test-fixtures/catalog $(SCHEMA_DIR)/oci/test-fixtures/catalog/generate.jsonnet
	jsonnet -J $(JSONNET_DIR)/vendor -m $(SCHEMA_DIR)/stori/test-fixtures/server-config $(SCHEMA_DIR)/stori/test-fixtures/server-config/generate.jsonnet

# Generate and validate OpenAPI specification file.
spec: generate-openapi validate-openapi

# Generate OpenAPI Specification.
generate-openapi:
	jsonnet -J $(JSONNET_DIR)/vendor -m $(DOCS_DIR) $(SCRIPTS_DIR)/gen-openapi.jsonnet

# Validate generated OpenAPI specification file.
validate-openapi:
	swagger-cli validate $(OPENAPI_FILE)
