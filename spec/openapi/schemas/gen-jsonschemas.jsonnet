local oci = import 'oci.libsonnet';
local types = import 'types.libsonnet';

local v4 = {
  '$schema': types.jsonSchemaV4,
};

{
  'oci-config-schema.json': v4 + oci.config,
  'oci-image-manifest-schema.json': v4 + oci.imageManifest,
  'oci-image-index-schema.json': v4 + oci.imageIndex,
  'oci-error-schema.json': v4 + oci.errors,
  'oci-catalog-schema.json': v4 + oci.catalog,
  'oci-tag-list-schema.json': v4 + oci.tagList,
}
