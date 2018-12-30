local common = import '../libsonnet/schemas/common.libsonnet';
local oci = import '../libsonnet/schemas/oci.libsonnet';
local stori = import '../libsonnet/schemas/stori.libsonnet';

local v4 = {
  '$schema': common.jsonSchemaV4,
};

{
  'oci/config-schema.json': oci.imageConfig(),
  'oci/image-manifest-schema.json': oci.imageManifest(),
  'oci/image-index-schema.json': oci.imageIndex(),
  'oci/error-schema.json': oci.errors(),
  'oci/catalog-schema.json': oci.catalog(),
  'oci/tag-list-schema.json': oci.tagsList(),
  'stori/registry-config-schema.json': stori.registryConfig(),
}
