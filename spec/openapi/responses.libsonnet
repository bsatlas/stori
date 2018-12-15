local oapi = import 'openapi-jsonnet/v3.0.0/openapi.libsonnet';
local resp = oapi.response;
local mt = import 'media-types.libsonnet';
local schemas = import 'schemas/schemas.libsonnet';
local h = import 'headers.libsonnet';

local err = {

  local content = mt.err,

  local badRequest =
    resp.new('400', 'Bad Request', content)
    .addHeader(h.common.contentLength)
    .addHeader(h.common.date)
    .addHeader(h.common.contentType)
    .addHeader(h.common.contentTypeOptions)
  ,

  local unauthorized =
    resp.new('401', 'Unauthorized', content)
    .addHeader(h.common.wwwAuth)
    .addHeader(h.common.contentLength)
    .addHeader(h.common.date)
    .addHeader(h.common.contentType)
    .addHeader(h.common.contentTypeOptions)
  ,

  local forbidden =
    resp.new('403', 'Forbidden', content)
    .addHeader(h.common.contentLength)
    .addHeader(h.common.date)
    .addHeader(h.common.contentType)
    .addHeader(h.common.contentTypeOptions)
  ,

  local notFound =
    resp.new('404', 'Not Found', content)
    .addHeader(h.common.contentLength)
    .addHeader(h.common.date)
    .addHeader(h.common.contentType)
    .addHeader(h.common.contentTypeOptions)
  ,

  local rangeNotSatisfiable =
    resp.new('416', 'Not Found', content)
    .addHeader(h.common.contentLength)
    .addHeader(h.common.date)
    .addHeader(h.common.contentType)
    .addHeader(h.common.contentTypeOptions)
    .addHeader(h.docker.uploadUUID)
  ,

  local tooManyRequests =
    resp.new('429', 'Too Many Requests', content)
    .addHeader(h.common.contentLength)
    .addHeader(h.common.date)
    .addHeader(h.common.contentType)
    .addHeader(h.common.contentTypeOptions)
  ,


  unauthorized: unauthorized,
  forbidden: forbidden,
  notFound: notFound,
  tooManyRequests: tooManyRequests,
  badRequest: badRequest,
  rangeNotSatisfiable: rangeNotSatisfiable,
};

local common = {

  local ok =
    resp.new('200', 'OK')
    .addHeader(h.common.contentLength)
    .addHeader(h.common.date)
    .addHeader(h.common.contentType)
    .addHeader(h.common.contentTypeOptions)
  ,

  local accepted =
    resp.new('202', 'Accepted')
    .addHeader(h.common.contentLength)
    .addHeader(h.common.date)
    .addHeader(h.common.contentType)
    .addHeader(h.common.contentTypeOptions)
  ,

  local created =
    resp.new('201', 'Created')
    .addHeader(h.common.contentLength)
    .addHeader(h.common.date)
    .addHeader(h.common.contentType)
    .addHeader(h.common.contentTypeOptions)
  ,

  local noContent =
    resp.new('204', 'No Content')
    .addHeader(h.common.contentLength)
    .addHeader(h.common.date)
    .addHeader(h.common.contentType)
    .addHeader(h.common.contentTypeOptions)
  ,

  local partialContent =
    resp.new('206', 'Partial Content')
    .addHeader(h.common.contentLength)
    .addHeader(h.common.date)
    .addHeader(h.common.contentType)
    .addHeader(h.common.contentTypeOptions)
  ,

  local temporaryRedirect =
    resp.new('307', 'Temporary Redirect')
    .addHeader(h.common.contentLength)
    .addHeader(h.common.date)
    .addHeader(h.common.contentType)
    .addHeader(h.common.contentTypeOptions)
  ,

  ok: ok,
  accepted: accepted,
  created: created,
  noContent: noContent,
  partialContent: partialContent,
  temporaryRedirect: temporaryRedirect,
};

local oci = {

  local verify =
    common.ok
    .addHeader(h.docker.version)
    .addHeader(h.common.link)
  ,

  local catalogList =
    common.ok
  ,

  local tagsList =
    common.ok
  ,

  local manifestGet =
    common.ok
    .addHeader(h.docker.contentDigest)
    .addContent(mt.oci.v1.imageManifest)
    .addContent(mt.oci.v1.index)
  ,

  local manifestExists =
    common.ok
  ,

  local manifestCreate =
    common.ok
  ,

  local manifestDelete =
    common.ok
  ,

  local blobDownload =
    common.ok
    .addHeader(h.docker.contentDigest)
  ,

  local blobExists =
    common.ok
  ,

  local blobDelete =
    common.accepted
  ,

  local blobUploadInit =
    common.accepted
    .addHeader(h.common.location)
    .addHeader(h.common.range)
    .addHeader(h.docker.uploadUUID)
  ,

  local blobMount =
    common.created
    .addHeader(h.common.location)
    .addHeader(h.docker.uploadUUID)
  ,

  local blobUploadStatus =
    common.noContent
    .addHeader(h.common.range)
    .addHeader(h.docker.uploadUUID)
  ,

  local blobUploadChunk =
    common.noContent
    .addHeader(h.common.location)
    .addHeader(h.common.range)
    .addHeader(h.docker.uploadUUID)
  ,

  local blobUploadComplete =
    common.accepted
    .addHeader(h.docker.contentDigest)
    .addHeader(h.common.location)
  ,

  local blobUploadCancel =
    common.noContent
  ,


  verify: verify,
  catalogList: catalogList,
  tagsList: tagsList,
  manifestGet: manifestGet,
  manifestExists: manifestExists,
  manifestCreate: manifestCreate,
  manifestDelete: manifestDelete,
  blobDownload: blobDownload,
  blobExists: blobExists,
  blobDelete: blobDelete,
  blobUploadInit: blobUploadInit,
  blobMount: blobMount,
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
