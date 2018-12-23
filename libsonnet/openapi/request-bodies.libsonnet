local oapi = import 'openapi-jsonnet/v3.0.0/openapi.libsonnet';
local requestBody = oapi.requestBody.new;
local mt = import 'media-types.libsonnet';

local oci = {

  v1:: {
    manifestCreate::
      requestBody()
      .addContent(mt.oci.v1.imageManifest),
  },
};

{
  oci:: oci,
}
