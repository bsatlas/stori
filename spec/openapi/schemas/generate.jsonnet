local oci = import 'oci.libsonnet';

local jsonschema = {
  '$schema': 'http://json-schema.org/draft-04/schema#',
};

{
  'oci-config-schema.json': jsonschema + oci.config,
  'oci-image-manifest-schema.json': jsonschema + oci.imageManifest,
  'oci-image-index-schema.json': jsonschema + oci.imageIndex,
  'oci-error-schema.json': jsonschema + oci.errors,
}
