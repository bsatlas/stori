local errors = {

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

  unauthorized: unauthorized,
  forbidden: forbidden,
  notFound: notFound,
  requestedRangeNotSatisfiable: requestRangeNotSatisfiable,
  tooManyRequests: tooManyRequests,


};

{
  errorCodes: errorCodes,
}
