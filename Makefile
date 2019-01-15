.PHONY: schemas spec generate-openapi validate-openapi build test test-fixtures embed-files

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

.PHONY: embed-files
embed-files:
	find schema -name gen.go -execdir go generate {} \;

.PHONY: test-fixtures
test-fixtures:
	scripts/generate-test-fixtures.sh

.PHONY: openapi
openapi: generate-openapi validate-openapi

.PHONY: generate-openapi
generate-openapi:
	scripts/generate-openapi.sh ${JSONNET_DIR} ${OPENAPI_DIR}

.PHONY: validate-openapi
validate-openapi:
	scripts/validate-openapi.sh ${OPENAPI_DIR}

.PHONY: update-jsonnet-libraries
update-jsonnet-libraries:
	scripts/update-jsonnet-libraries.sh ${JSONNET_DIR}
