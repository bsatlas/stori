package stori

import (
	"github.com/atlaskerr/stori/schema"

	"github.com/xeipuuv/gojsonschema"
)

var schemaFS = schema.FS(false)

// ServerConfigLoader provides a JSONLoader that can be used to validate
// a configuration file for serving a stori registry.
var ServerConfigLoader = func() gojsonschema.JSONLoader {
	path := "file:///stori/server-config.schema.json"
	return gojsonschema.NewReferenceLoaderFileSystem(path, schemaFS)
}()
