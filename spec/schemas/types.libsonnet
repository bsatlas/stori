{
  date: { type: 'string', format: 'date-time' },

  string: { type: 'string' },

  bool: { type: 'boolean' },

  int64: {
    type: 'integer',
    minimum: -9223372036854776000,
    maximum: 9223372036854776000,
  },

  mapStringObject: {
    type: 'object',
    patternProperties: {
      '.{1,}': { type: 'object' },
    },
  },

  mapStringString: {
    type: 'object',
    patternProperties: {
      '.{1,}': { type: 'string' },
    },
  },

  arrayOfStrings: {
    type: 'array',
    items: { type: 'string' },
  },
}
