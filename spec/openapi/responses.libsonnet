local oapi = import 'openapi-jsonnet/v3.0.0/openapi.libsonnet';
local resp = oapi.response;
local mt = import 'media-types.libsonnet';
local schemas = import 'schemas/schemas.libsonnet';

local err = {

  local content = mt.err,

  local badRequest =
    resp.new('400', 'Accepted', content),

  local unauthorized =
    resp.new('401', 'Unauthorized', content),

  local forbidden =
    resp.new('403', 'Forbidden', content),

  local notFound =
    resp.new('404', 'Not Found', content),

  local tooManyRequests =
    resp.new('429', 'Too Many Requests', content),


  unauthorized: unauthorized,
  forbidden: forbidden,
  notFound: notFound,
  tooManyRequests: tooManyRequests,
  badRequest: badRequest,
};

local common = {

  local ok =
    resp.new('200', 'OK'),

  local accepted =
    resp.new('202', 'Accepted'),

  local created =
    resp.new('201', 'Created'),

  local noContent =
    resp.new('204', 'No Content'),

  local partialContent =
    resp.new('206', 'Partial Content'),

  local temporaryRedirect =
    resp.new('307', 'Temporary Redirect'),

  ok: ok,
  accepted: accepted,
  created: created,
  noContent: noContent,
  partialContent: partialContent,
  temporaryRedirect: temporaryRedirect,
};

local oci = {

  local verify = common.ok,
  local catalogList = common.ok,
  local tagsList = common.ok,
  local manifestGet = common.ok,
  local manifestExists = common.ok,
  local manifestCreate = common.ok,
  local manifestDelete = common.ok,
  local manifestDownload = common.ok,
  local blobExists = common.ok,
  local blobDelete = common.accepted,
  local blobUploadInit = common.accepted,
  local blobUploadStatus = common.noContent,
  local blobUploadChunk = common.noContent,
  local blobUploadComplete = common.noContent,
  local blobUploadCancel = common.noContent,

  verify: verify,
  catalogList: catalogList,
  tagsList: tagsList,
  manifestGet: manifestGet,
  manifestExists: manifestExists,
  manifestCreate: manifestCreate,
  manifestDelete: manifestDelete,
  blobDownload: manifestDownload,
  blobExists: blobExists,
  blobDelete: blobDelete,
  blobUploadInit: blobUploadInit,
  blobUploadStatus: blobUploadStatus,
  blobUploadChunk: blobUploadChunk,
  blobUploadComplete: blobUploadComplete,
  blobUploadCancel: blobUploadCancel,

};

{
  err:: err,
  common:: common,
  oci:: oci,
}
