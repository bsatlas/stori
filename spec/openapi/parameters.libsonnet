local oapi = import 'openapi-jsonnet/v3.0.0/openapi.libsonnet';
local param = oapi.parameter;
local schemas = import 'schemas/schemas.libsonnet';


local namespace = param.new(
  name='namespace',
  paramIn='path',
  description='A logical grouping of repositories.',
  schema=schemas.common.string,
);

local repository = param.new(
  name='repository',
  paramIn='path',
  description='A place to store an image.',
  schema=schemas.common.string,
);

local reference = param.new(
  name='reference',
  paramIn='path',
  description='Can either be a tag name or digest',
  schema=schemas.common.string,
);

local digest = param.new(
  name='digest',
  paramIn='path',
  description='A content addressable identifier.',
  schema=schemas.common.string,
);

local uuid = param.new(
  name='uuid',
  paramIn='path',
  description='A universally unique identifier.',
  schema=schemas.common.string,
);

{
  namespace: namespace,
  repository: repository,
  reference: reference,
  digest: digest,
  uuid: uuid,
}
