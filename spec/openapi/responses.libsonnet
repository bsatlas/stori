local errorCodes = {
  requestedRangeNotSatisfiable: {
    '416': {
      description: 'Requested Range Not Satisfiable',
    },
  },

  accepted: {
    '202': {
      description: 'Accepted',
    },
  },

  created: {
    '201': {
      description: 'Created',
    },
  },
};

{
  errorCodes: errorCodes,
}
