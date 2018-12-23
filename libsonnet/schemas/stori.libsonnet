local common = import 'common.libsonnet';

local server = {

  local tls = {
    type: 'object',
    description: 'TLS configuration options.',
    properties: {
      certFile: common.string {
        description: "Path to registry's x509 certificate.",
      },
      keyFile: common.string {
        description: "Path to registry's private key.",
      },
    },
  },

  type: 'object',
  description: 'Server-specific configuration.',
  properties: {
    address: common.string {
      description: 'The IP/hostname and port to listen on.',
    },
    tls: tls,
  },
};

{
  registryConfig(output='jsonschema'):: {
    [if output != 'openapi' then '$schema']: common.jsonSchemaV4,
    type: 'object',
    description: "Stori registry's server configuration file format.",
    properties: {
      server: server,
    },
  },
}
