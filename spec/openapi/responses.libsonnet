local errors = {

  local unauthorized = {
    '401': {
      description: 'Unauthorized',
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
  notFound: notFound,
  requestedRangeNotSatisfiable: requestRangeNotSatisfiable,

};

{
  errorCodes: errorCodes,
}
