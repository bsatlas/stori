local common = import 'common.libsonnet';
local oci = import 'oci.libsonnet';

local v4 = {
  '$schema': common.jsonSchemaV4,
};

{
  'oci-config-schema.json': v4 + oci.config('jsonschema'),
  'oci-image-manifest-schema.json': v4 + oci.imageManifest('jsonschema'),
  'oci-image-index-schema.json': v4 + oci.imageIndex('jsonschema'),
  'oci-error-schema.json': v4 + oci.errors,
  'oci-catalog-schema.json': v4 + oci.catalog,
  'oci-tag-list-schema.json': v4 + oci.tagList('jsonschema'),
}
