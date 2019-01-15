package schema

import (
	"github.com/xeipuuv/gojsonschema"
)

var schemaFS = FS(false)

// ServerConfigLoader provides a JSONLoader that can be used to validate
// a configuration file for serving a stori registry.
var ServerConfigLoader = func() gojsonschema.JSONLoader {
	path := "file:///server-config.schema.json"
	return gojsonschema.NewReferenceLoaderFileSystem(path, schemaFS)
}
