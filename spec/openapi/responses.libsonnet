local errors = {

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

};

{
  errorCodes: errorCodes,
}
