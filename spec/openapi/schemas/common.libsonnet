local string = { type: 'string' };

{
  jsonSchemaV4: 'http://json-schema.org/draft-04/schema#',

  string: string,

  binary: string { format: 'binary' },

  date: string { format: 'date-time' },

  bool: { type: 'boolean' },

  int64: {
    type: 'integer',
    minimum: -9223372036854776000,
    maximum: 9223372036854776000,
  },

  mapStringObject(output):: {
    type: 'object',
    [if output == 'jsonschema' then 'patternProperties' else 'x-patternProperties']: {
      '.{1,}': {
        type: 'object',
      },
    },
  },

  mapStringString(output):: {
    type: 'object',
    [if output == 'jsonschema' then 'patternProperties' else 'x-patternProperties']: {
      '.{1,}': {
        type: 'string',
      },
    },
  },

  arrayOfStrings: {
    type: 'array',
    items: string,
  },

  emptyObject: {
    type: 'object',
    properties: {},
    additionalProperties: false,
  },
}
