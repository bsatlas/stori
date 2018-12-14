//{
//  oci:: {
//    v1:: {
//      imageManifest:: 'application/vnd.oci.image.manifest.v1+json',
//      index:: 'application/vnd.oci.index.v1+json',
//      config:: 'application/vnd.oci.config.v1+json',
//      descriptor:: 'application/vnd.oci.descriptor.v1+json',
//      layout:: 'application/vnd.oci.layout.header.v1+json',
//      layerTar:: 'application/vnd.oci.layer.v1.tar',
//      layerTarGz:: 'application/vnd.oci.layer.v1.tar+gzip',
//      layerNoDistTar:: 'application/vnd.oci.layer.nondistributable.v1.tar',
//      layerNoDistTarGz:: 'application/vnd.oci.layer.nondistributable.v1.tar+gzip',
//    },
//  },
//
//  json:: 'application/json',
//  octetStream: 'application/octet-stream',
//}
local oapi = import 'openapi-jsonnet/v3.0.0/openapi.libsonnet';
local mt = oapi.mediaType;
local schemas = import 'schemas/schemas.libsonnet';

local json = 'application/json';

local err = {
  [json]: mt.new(schemas.oci.err),
};

{
  err: err,
}
