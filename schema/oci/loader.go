package oci

import (
	"github.com/atlaskerr/stori/schema"

	"github.com/xeipuuv/gojsonschema"
)

var schemaFS = schema.FS(false)

// ImageIndexLoader provides a JSONLoader that can be used to validate an image
// index.
var ImageIndexLoader = func() gojsonschema.JSONLoader {
	path := "file:///oci/image-index.schema.json"
	return gojsonschema.NewReferenceLoaderFileSystem(path, schemaFS)
}()

// ImageManifestLoader provides a JSONLoader that can be used to validate an
// image manifest.
var ImageManifestLoader = func() gojsonschema.JSONLoader {
	path := "file:///oci/image-manifest.schema.json"
	return gojsonschema.NewReferenceLoaderFileSystem(path, schemaFS)
}()

// ImageConfigLoader provides a JSONLoader that can be used to validate an image
// config.
var ImageConfigLoader = func() gojsonschema.JSONLoader {
	path := "file:///oci/image-config.schema.json"
	return gojsonschema.NewReferenceLoaderFileSystem(path, schemaFS)
}()

// TagListLoader provides a JSONLoader that can be used to validate an tag list.
var TagListLoader = func() gojsonschema.JSONLoader {
	path := "file:///oci/tag-list.schema.json"
	return gojsonschema.NewReferenceLoaderFileSystem(path, schemaFS)
}()

// CatalogLoader provides a JSONLoader that can be used to validate a catalog of
// repositories.
var CatalogLoader = func() gojsonschema.JSONLoader {
	path := "file:///oci/catalog.schema.json"
	return gojsonschema.NewReferenceLoaderFileSystem(path, schemaFS)
}()

// ErrorsLoader provides a JSONLoader that can be used to validate an
// OCI-compliant error response.
var ErrorsLoader = func() gojsonschema.JSONLoader {
	path := "file:///oci/errors.schema.json"
	return gojsonschema.NewReferenceLoaderFileSystem(path, schemaFS)
}()

// contentDescriptorLoader provides a JSONLoader that can be used to validate a
// content descriptor.
var contentDescriptorLoader = func() gojsonschema.JSONLoader {
	path := "file:///oci/content-descriptor.schema.json"
	return gojsonschema.NewReferenceLoaderFileSystem(path, schemaFS)
}()
