.PHONY: schemas spec generate-openapi validate-openapi build test

SPEC_DIR = spec
OPENAPI_DIR = openapi
DOCS_DIR = Documentation
SCRIPTS_DIR = scripts
OPENAPI_FILE = $(DOCS_DIR)/openapi.json
JSONSCHEMA_DIR = $(DOCS_DIR)/json-schemas
JSONNET_DIR = libsonnet

test:
	go test -cover ./...

build:
	go build .

clean:
	rm ./stori

# Generate json-schemas.
schemas:
	jsonnet -m $(JSONSCHEMA_DIR) $(SCRIPTS_DIR)/gen-jsonschemas.jsonnet

# Generate and validate OpenAPI specification file.
spec: generate-openapi validate-openapi

# Generate OpenAPI Specification.
generate-openapi:
	jsonnet -J $(JSONNET_DIR)/vendor -m $(DOCS_DIR) $(SCRIPTS_DIR)/gen-openapi.jsonnet

# Validate generated OpenAPI specification file.
validate-openapi:
	swagger-cli validate $(OPENAPI_FILE)
