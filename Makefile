.PHONY: schemas spec generate-openapi validate-openapi

SPEC_DIR = spec
OPENAPI_DIR = $(SPEC_DIR)/openapi
SCHEMA_DIR = $(SPEC_DIR)/json-schemas
OPENAPI_FILE = $(OPENAPI_DIR)/openapi.json

# Generate json-schemas.
schemas:
	jsonnet -m $(SCHEMA_DIR) $(OPENAPI_DIR)/schemas/gen-jsonschemas.jsonnet

# Generate and validate OpenAPI specification file.
spec: generate-openapi validate-openapi

# Generate OpenAPI Specification.
generate-openapi:
	jsonnet -J $(OPENAPI_DIR)/vendor -m $(OPENAPI_DIR) $(OPENAPI_DIR)/openapi.jsonnet

# Validate generated OpenAPI specification file.
validate-openapi:
	swagger-cli validate $(OPENAPI_FILE)
