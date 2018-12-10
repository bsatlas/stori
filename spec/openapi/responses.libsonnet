local mediaTypes = import 'media-types.libsonnet';
local schemas = import 'schemas/schemas.libsonnet';

local errors = {

  // Create OCI-style error responses.
  // @param errorCode The HTTP error code of the response.
  // @param description Description of the error code.
  local errorResponse(errorCode, description) = {
    [errorCode]: {
      description: description,
      content: {
        [mediaTypes.json]: {
          schema: schemas.oci.errors,
        },
      },
    },
  },

  badRequest: errorResponse('400', 'Bad Request'),
  unauthorized: errorResponse('401', 'Unauthorized'),
  methodNotAllowed: errorResponse('405', 'Method Not Allowed'),
  notFound: errorResponse('404', 'Not Found'),
  forbidden: errorResponse('403', 'Forbidden'),
  RangeNotSatisfiable: errorResponse('416', 'Requested Range Not Satisfiable'),
  tooManyRequests: errorResponse('429', 'Too Many Requests'),
};

local common = {


  local accepted = {
    '202': {
      description: 'Accepted',
    },
  },

  local created = {
    '201': {
      description: 'Created',
    },
  },

  local noContent = {
    '204': {
      description: 'No Content',
    },
  },

  local partialContent = {
    '206': {
      description: 'Partial Content',
    },
  },

  local temporaryRedirect = {
    '307': {
      description: 'Temporary Redirect',
    },
  },

  accepted: accepted,
  created: created,
  noContent: noContent,
  partialContent: partialContent,
  temporaryRedirect: temporaryRedirect,
};

// Initalize 200 response.
// @param content An object mapping of media types to their schemas.
local okResponse(content={}) = {
  '200': {
    description: 'OK',
    content: content,
  },
};

// Initialize a content object
// @param mediaType The media type of the response.
// @param schema The schema of the media type.
local newContent(mediaType, schema) = {
  [mediaType]: {
    schema: schema,
  },
};

// Combine an array of responses into one object.
// @param responses An array of response objects.
local combineResponses(responses) = {};

local oci = {

  local content = {

    emptyResponse:
      newContent(
        mediaTypes.json, schemas.types.emptyObject
      ),

    catalog:
      newContent(
        mediaTypes.json, schemas.oci.catalog
      ),

    tags:
      newContent(
        mediaTypes.json, schemas.oci.tagList
      ),

    manifest:
      newContent(
        mediaTypes.oci.v1.imageManifest,
        schemas.oci.imageManifest
      ),

    binaryData:
      newContent(
        mediaTypes.octetStream,
        schemas.types.binary,
      ),

  },

  base::
    okResponse()
    + errors.unauthorized
    + errors.forbidden
    + errors.notFound
    + errors.tooManyRequests,

  catalog::
    okResponse(content.catalog)
    + errors.unauthorized
    + errors.forbidden
    + errors.tooManyRequests,

  tags::
    okResponse(content.tags)
    + errors.unauthorized
    + errors.forbidden
    + errors.tooManyRequests,

  getManifest:: okResponse(content.manifest),

  checkManifest:: okResponse(),
  putManifest:: okResponse(content.emptyResponse),
  deleteManifest:: okResponse(content.emptyResponse),
  getBlob:: okResponse(content.binaryData),
  checkBlob:: okResponse(),
  deleteBlob:: okResponse(),
  initBlobUploadOrMount:: okResponse(),
  statusBlobUpload:: {},
  uploadBlobChunk:: okResponse(),
  uploadBlobComplete:: okResponse(),
  cancelBlobUpload:: okResponse(),
  mountBlob:: okResponse(),

};

{
  errors: errors,
  common: common,
  oci:: oci,
}
