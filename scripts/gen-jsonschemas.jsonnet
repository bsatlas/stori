local common = import '../libsonnet/schemas/common.libsonnet';
local oci = import '../libsonnet/schemas/oci.libsonnet';
local stori = import '../libsonnet/schemas/stori.libsonnet';

local v4 = {
  '$schema': common.jsonSchemaV4,
};

{
  'oci/config-schema.json': v4 + oci.config('jsonschema'),
  'oci/image-manifest-schema.json': v4 + oci.imageManifest('jsonschema'),
  'oci/image-index-schema.json': v4 + oci.imageIndex('jsonschema'),
  'oci/error-schema.json': v4 + oci.err,
  'oci/catalog-schema.json': v4 + oci.catalog,
  'oci/tag-list-schema.json': v4 + oci.tagList('jsonschema'),
  'stori/registry-config-schema.json': stori.registryConfig(),
}
