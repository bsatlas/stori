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

local spec = oapi.new(info=info, paths=paths);

{
  'openapi.json': spec,
}
