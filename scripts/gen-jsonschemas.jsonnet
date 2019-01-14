local schema = import '../schema/schema.libsonnet';
local oci = schema.oci;
local stori = schema.stori;

{
  // OCI
  'oci/image-config.schema.json': oci.imageConfig(),
  'oci/image-manifest.schema.json': oci.imageManifest(),
  'oci/image-index.schema.json': oci.imageIndex(),
  'oci/content-descriptor.schema.json': oci.contentDescriptor(),
  'oci/errors.schema.json': oci.errors(),
  'oci/catalog.schema.json': oci.catalog(),
  'oci/tag-list.schema.json': oci.tagsList(),

  // Stori
  'stori/server-config.schema.json': stori.serverConfig(),

  // Builtin backends
  'stori/storage/backend/inmem.schema.json': stori.storage.backend.inmem(),
}
