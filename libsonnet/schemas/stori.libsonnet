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
  certFile: 'Path to x509 certificate.',
  keyFile: 'Path to private key file,',
};

local JSV7 = 'jsonschemaV7';
local JSV7Schema = 'http://json-schema.org/draft-07/schema#';

// Stori server config file schema
local serverConfig() = {

  local address = {
    type: 'string',
    description: d.address,
  },

  local tls = {

    local certFile = { type: 'string', description: d.certFile },
    local keyFile = { type: 'string', description: d.keyFile },

    type: 'object',
    description: d.tls,
    properties: {
      certFile: certFile,
      keyFile: keyFile,
    },
  },

  '$id': 'http://storimages.org/schema/server-config',
  '$schema': JSV7Schema,
  type: 'object',
  description: d.server,
  properties: {
    address: address,
    tls: tls,
  },
};

{
  serverConfig: serverConfig,
}
