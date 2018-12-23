local oapi = import 'openapi-jsonnet/v3.0.0/openapi.libsonnet';
local mt = oapi.mediaType;
local ex = oapi.example;
local liboci = import 'oci-jsonnet/image/v1.0.1/spec.libsonnet';
local ociExamples = liboci.examples;
local schemas = import '../schemas/schemas.libsonnet';

local json = 'application/json';

local err = {
  [json]: mt.new(schemas.oci.err),
};

local common = {

  octetStream: {
    'application/octet-stream':
      mt.new(schemas.common.binary),
  },

};

local oci = {
  v1:: {

    imageManifest:: {
      'application/vnd.oci.image.manifest.v1+json':
        mt.new(schemas.oci.imageManifest('openapi'))
        .addExample(ociExamples.manifest),
    },

    index:: {
      'application/vnd.oci.index.v1+json':
        mt.new(schemas.oci.imageIndex('openapi')),
    },

    config:: {
      'application/vnd.oci.config.v1+json':
        mt.new(schemas.oci.config('openapi')),
    },

    descriptor:: 'application/vnd.oci.descriptor.v1+json',
    layout:: 'application/vnd.oci.layout.header.v1+json',

    layerTar:: {
      'application/vnd.oci.layer.v1.tar':
        mt.new(schemas.common.binary),
    },

    layerTarGz:: {
      'application/vnd.oci.layer.v1.tar+gzip':
        mt.new(schemas.common.binary),
    },

    layerNoDistTar:: {
      'application/vnd.oci.layer.nondistributable.v1.tar':
        mt.new(schemas.common.binary),
    },

    layerNoDistTarGz:: {
      'application/vnd.oci.layer.nondistributable.v1.tar+gzip':
        mt.new(schemas.common.binary),
    },

    catalog:: {
      [json]: mt.new(schemas.oci.catalog),
    },

    tagsList:: {
      [json]: mt.new(schemas.oci.tagList('openapi')),
    },
  },


};


{
  err: err,
  common: common,
  oci: oci,
}
