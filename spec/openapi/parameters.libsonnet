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

local digestQuery = param.new(
  name='digest',
  paramIn='query',
  style='form',
  description='A content addressable identifier.',
  schema=schemas.common.string,
);

local mount = param.new(
  name='mount',
  paramIn='query',
  style='form',
  description='The digest of a blob in the source repository.',
  schema=schemas.common.string,
);

local mountFrom = param.new(
  name='from',
  paramIn='query',
  style='form',
  description='The source repository the referenced blob.',
  schema=schemas.common.string,
);

local uuid = param.new(
  name='uuid',
  paramIn='path',
  description='A universally unique identifier.',
  schema=schemas.common.string,
);

local n = param.new(
  name='n',
  paramIn='query',
  style='form',
  description='',
  schema=schemas.common.string,
);

local last = param.new(
  name='last',
  paramIn='query',
  style='form',
  description='',
  schema=schemas.common.string,
);

{
  namespace: namespace,
  repository: repository,
  reference: reference,
  digest: digest,
  digestQuery: digestQuery,
  mount: mount,
  mountFrom: mountFrom,
  uuid: uuid,
  n: n,
  last: last,
}
