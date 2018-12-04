.PHONY: schemas

SPECDIR = spec
SCHEMADIR = $(SPECDIR)/schemas

# Generate json-schemas
schemas:
	jsonnet -m $(SCHEMADIR) $(SPECDIR)/oci/oci-schemas.jsonnet
