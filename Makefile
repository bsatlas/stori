.PHONY: schemas spec generate-openapi validate-openapi build test

SPEC_DIR = spec
OPENAPI_DIR = openapi
DOCS_DIR = Documentation
SCRIPTS_DIR = scripts
OPENAPI_FILE = $(DOCS_DIR)/openapi.json
SCHEMA_DIR = schema
JSONNET_DIR = jsonnet

test:
	go test -cover ./...

build:
	go build -o bin/stori github.com/atlaskerr/stori/cmd/stori

clean:
	rm ./stori

# Generate json-schemas.
schemas:
	jsonnet -m $(SCHEMA_DIR) $(SCRIPTS_DIR)/gen-jsonschemas.jsonnet
	go generate $(SCHEMA_DIR)/gen.go

test-fixtures:
	jsonnet -J $(JSONNET_DIR)/vendor -m $(SCHEMA_DIR)/oci/test-fixtures/image-index $(SCHEMA_DIR)/oci/test-fixtures/image-index/generate.jsonnet

# Generate and validate OpenAPI specification file.
spec: generate-openapi validate-openapi

# Generate OpenAPI Specification.
generate-openapi:
	jsonnet -J $(JSONNET_DIR)/vendor -m $(DOCS_DIR) $(SCRIPTS_DIR)/gen-openapi.jsonnet

# Validate generated OpenAPI specification file.
validate-openapi:
	swagger-cli validate $(OPENAPI_FILE)
