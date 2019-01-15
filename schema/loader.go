package schema

import (
	"fmt"

	"github.com/xeipuuv/gojsonschema"
)

var schemaFS = FS(false)

func load(file string) gojsonschema.JSONLoader {
	path := fmt.Sprintf("file://%s", file)
	return gojsonschema.NewReferenceLoaderFileSystem(path, schemaFS)
}

// ServerConfigLoader provides a JSONLoader that can be used to validate
// a configuration file for serving a stori registry.
var ServerConfigLoader = load("/server-config.schema.json")
