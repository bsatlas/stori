local mediaTypes = import 'media-types.libsonnet';

local errorSchema = {
  type: 'object',
  properties: {
    errors: {
      type: 'array',
      items: {
        type: 'object',
        properties: {
          code: { type: 'string' },
          message: { type: 'string' },
          detail: { type: 'string' },
        },
      },
    },
  },
};

local errors = {

  local badRequest = {
    '400': {
      description: 'Bad Request',
      content: {
        [mediaTypes.json]: {
          schema: errorSchema,
        },
      },
    },
  },

  local unauthorized = {
    '401': {
      description: 'Unauthorized',
      content: {
        [mediaTypes.json]: {
          schema: errorSchema,
        },
      },
    },
  },

  local methodNotAllowed = {
    '405': {
      descrption: 'Method Not Allowed',
      content: {
        [mediaTypes.json]: {
          schema: errorSchema,
        },
      },
    },
  },

  local forbidden = {
    '403': {
      description: 'Forbidden',
      content: {
        [mediaTypes.json]: {
          schema: errorSchema,
        },
      },
    },
  },


  local notFound = {
    '404': {
      description: 'Not Found',
      content: {
        [mediaTypes.json]: {
          schema: errorSchema,
        },
      },
    },
  },

  local requestedRangeNotSatisfiable = {
    '416': {
      description: 'Requested Range Not Satisfiable',
      content: {
        [mediaTypes.json]: {
          schema: errorSchema,
        },
      },
    },
  },

  local tooManyRequests = {
    '429': {
      description: 'Too Many Requests',
      content: {
        [mediaTypes.json]: {
          schema: errorSchema,
        },
      },
    },
  },


  badRequest: badRequest,
  unauthorized: unauthorized,
  forbidden: forbidden,
  methodNotAllowed: methodNotAllowed,
  notFound: notFound,
  requestedRangeNotSatisfiable: requestedRangeNotSatisfiable,
  tooManyRequests: tooManyRequests,
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
