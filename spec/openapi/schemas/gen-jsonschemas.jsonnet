local oci = import 'oci.libsonnet';

{
  'oci-config-schema.json': oci.config,
  'oci-image-manifest-schema.json': oci.imageManifest,
  'oci-image-index-schema.json': oci.imageIndex,
  'oci-error-schema.json': oci.errors,
  'oci-catalog-schema.json': oci.catalog,
  'oci-tag-list-schema.json': oci.tagList,
}
