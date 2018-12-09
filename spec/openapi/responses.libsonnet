local mediaTypes = import 'media-types.libsonnet';
local schemas = import 'schemas/schemas.libsonnet';

local errors = {

  local jsonError(errorCode, description) = {
    [errorCode]: {
      description: description,
      content: {
        [mediaTypes.json]: {
          schema: schemas.oci.errors,
        },
      },
    },
  },

  badRequest: jsonError('400', 'Bad Request'),
  unauthorized: jsonError('401', 'Unauthorized'),
  methodNotAllowed: jsonError('405', 'Method Not Allowed'),
  notFound: jsonError('404', 'Not Found'),
  forbidden: jsonError('403', 'Forbidden'),
  requestedRangeNotSatisfiable: jsonError('416', 'Requested Range Not Satisfiable'),
  tooManyRequests: jsonError('429', 'Too Many Requests'),
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
