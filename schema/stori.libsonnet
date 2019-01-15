// Copyright © 2018 Atlas Kerr atlaskerr@gmail.com
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

local d = {
  server: 'Server configuration data.',
  address: 'The IP/hostname and port to listen on.',
  tls: 'TLS configuration data.',
  tlsEnabled: 'Enable TLS.',
  certFile: 'Path to x509 certificate.',
  keyFile: 'Path to private key file,',
  clientCAFile: 'If set, any request presenting a client certificate signed by one of the authorities in the client-ca-file is authenticated with an identity corresponding to the CommonName of the client certificate.',
  storage: 'Configuration for different storage types.',
  blobstore: '',
  backend: '',
  backendName: '',
  hash: '',
  pluginConfig: '',
  namespaceCreate: 'Schema for creating a stori namespace.',
};

local JSV7 = 'jsonschemaV7';
local JSV7Schema = 'http://json-schema.org/draft-07/schema#';

local namespaceCreate(output=JSV7) = {
  local name = { type: 'string' },
  local maxSize = { type: 'string' },

  [if output == JSV7 then '$id']: 'http://storimages.org/schema/namespace-create',
  [if output == JSV7 then '$schema']: JSV7Schema,
  type: 'object',
  description: d.namespaceCreate,
  properties: {
    name: name,
    maxSize: maxSize,
  },
  required: ['name'],
  additionalProperties: false,
};

// Stori server config file schema
local serverConfig() = {

  local address = {
    type: 'string',
    description: d.address,
  },

  local tls = {

    local enabled = { type: 'boolean', description: d.tlsEnabled },
    local certFile = { type: 'string', description: d.certFile },
    local keyFile = { type: 'string', description: d.keyFile },
    local clientCAFile = { type: 'string', description: d.clientCAFile },

    type: 'object',
    description: d.tls,
    properties: {
      enabled: enabled,
      certFile: certFile,
      keyFile: keyFile,
      clientCAFile: clientCAFile,
    },
    'if': { properties: { enabled: { const: true } } },
    'then': { required: ['certFile', 'keyFile'] },
    additionalProperties: false,

  },

  local storage = {

    local backend = {
      type: 'object',
      description: d.backend,
      properties: {
        name: { type: 'string' },
        hash: { type: 'string' },
        config: { type: 'object' },
      },
      additionalProperties: false,
      required: [
        'name',
        'config',
      ],
    },

    local blobstore = {
      type: 'object',
      description: d.blobstore,
      properties: {
        name: { type: 'string' },
        hash: { type: 'string' },
        config: { type: 'object' },
      },
      additionalProperties: false,
      required: [
        'name',
        'config',
      ],
    },

    type: 'object',
    description: d.storage,
    properties: {
      backend: backend,
      blobstore: blobstore,
    },
  },

  '$id': 'http://storimages.org/schema/server-config',
  '$schema': JSV7Schema,
  type: 'object',
  description: d.server,
  properties: {
    address: address,
    tls: tls,
    storage: storage,
  },
  required: ['address'],
  additionalProperties: false,
};

{
  serverConfig: serverConfig,
  namespaceCreate: namespaceCreate,
  storage:: import 'storage/storage.libsonnet',
}
