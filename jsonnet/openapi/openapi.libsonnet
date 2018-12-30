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
local paths = import 'paths.libsonnet';

local contact = oapi.contact.new(
  name='Atlas Kerr',
  url='http://localhost',
  email='atlaskerr@gmail.com',
);

local license = oapi.license.new(
  name='Apache 2.0',
  url='http://www.apache.org/licenses/LICENSE-2.0',
);

local info = oapi.info.new(
  title='Stori Registry',
  version='v1.0.0',
  description='A secure implementation of the OCI Distribution Specification.',
  termsOfService='TBD',
  contact=contact,
  license=license,
);

oapi.new(info=info, paths=paths)
