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

  local forbidden = {
    '403': {
      description: 'Forbidden',
    },
  },

  local methodNotAllowed = {
    '405': {
      descrption: 'Method Not Allowed',
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

  badRequest: badRequest,
  unauthorized: unauthorized,
  forbidden: forbidden,
  methodNotAllowed: methodNotAllowed,
  notFound: notFound,
  requestedRangeNotSatisfiable: requestRangeNotSatisfiable,
  tooManyRequests: tooManyRequests,


};

{
  errorCodes: errorCodes,
}
