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

{
  errors: errors,
  common: common,
}
