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
local mt = oapi.mediaType;
local ex = oapi.example;
local liboci = import 'oci-jsonnet/image/v1.0.1/spec.libsonnet';
local ociExamples = liboci.examples;
local schemas = import 'oci-schemas/oci.libsonnet';

local json = 'application/json';

local err = {
  [json]: mt.new(schemas.errors('openapi')),
};

{
  err: err,
}
