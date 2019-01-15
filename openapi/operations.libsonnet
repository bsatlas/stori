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

local oapi = import 'openapi-jsonnet/v3.0.0/openapi.libsonnet';
local resp = import 'responses.libsonnet';
local op = oapi.operation;
local params = import 'parameters.libsonnet';
local mt = import 'media-types.libsonnet';
local req = import 'request-bodies.libsonnet';

// Stori Operations.
local stori = {

  local namespaceCreate =
    op.new(
      operationId='namespace-create',
      tags=['Namespaces'],
      summary='Create a namespace.',
    )
    .addResponse(resp.err.unauthorized),

  namespaceCreate:: namespaceCreate,
};

{
  stori:: stori,
}
