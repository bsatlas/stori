OPENAPI_DIR = openapi
JSONNET_DIR = jsonnet

.PHONY: test
test: clean test-fixtures schemas embed-files
	go test -cover ./...

.PHONY: coverage
coverage:
	go test -coverprofile=coverage.out ./...

.PHONY: build
build:
	scripts/build-stori.sh

.PHONY: clean
clean:
	scripts/clean.sh

# Generate json-schemas.
.PHONY: schemas
schemas:
	scripts/generate-jsonschemas.sh

# Generate go code from generated json.
.PHONY: embed-files
embed-files:
	find schema -name gen.go -execdir go generate {} \;

# Generate json test-fixtures 
.PHONY: test-fixtures
test-fixtures:
	scripts/generate-test-fixtures.sh

.PHONY: openapi
openapi: generate-openapi validate-openapi

# Generate an openapi spec.
.PHONY: generate-openapi
generate-openapi:
	scripts/generate-openapi.sh ${JSONNET_DIR} ${OPENAPI_DIR}

# Validate a generated openapi spec.
.PHONY: validate-openapi
validate-openapi:
	scripts/validate-openapi.sh ${OPENAPI_DIR}

.PHONY: update-jsonnet-libraries
update-jsonnet-libraries:
	scripts/update-jsonnet-libraries.sh ${JSONNET_DIR}
