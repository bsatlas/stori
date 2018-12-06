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
    },
  },

  local unauthorized = {
    '401': {
      description: 'Unauthorized',
    },
  },

  local methodNotAllowed = {
    '405': {
      descrption: 'Method Not Allowed',
    },
  },

  local forbidden = {
    '403': {
      description: 'Forbidden',
    },
  },


  local notFound = {
    '404': {
      description: 'Not Found',
    },
  },

  local requestedRangeNotSatisfiable = {
    '416': {
      description: 'Requested Range Not Satisfiable',
    },
  },

  local tooManyRequests = {
    '429': {
      description: 'Too Many Requests',
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
