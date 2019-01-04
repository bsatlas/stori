local oci = import '../jsonnet/schemas/oci.libsonnet';
local stori = import '../jsonnet/schemas/stori.libsonnet';

{
  'oci/image-config.schema.json': oci.imageConfig(),
  'oci/image-manifest.schema.json': oci.imageManifest(),
  'oci/image-index.schema.json': oci.imageIndex(),
  'oci/content-descriptor.schema.json': oci.contentDescriptor(),
  'oci/errors.schema.json': oci.errors(),
  'oci/catalog.schema.json': oci.catalog(),
  'oci/tag-list.schema.json': oci.tagsList(),
  'stori/server-config.schema.json': stori.serverConfig(),
}
