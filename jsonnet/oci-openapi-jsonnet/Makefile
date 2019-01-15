# Generate OpenAPI Specification.
generate:
	jsonnet -J vendor -m . openapi.jsonnet

# Validate generated OpenAPI specification file.
validate:
	swagger-cli validate openapi.json
