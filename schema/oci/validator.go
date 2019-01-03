package oci

import (
	"github.com/atlaskerr/stori/schema"

	"github.com/xeipuuv/gojsonschema"
)

var schemaFS = schema.FS(false)

// ImageIndexValidator validates an OCI image index.
var ImageIndexValidator = func() *schema.Validator {
	path := "/oci/image-index.schema.json"
	loader := gojsonschema.NewReferenceLoaderFileSystem(path, schemaFS)
	return &schema.Validator{Schema: loader}
}
