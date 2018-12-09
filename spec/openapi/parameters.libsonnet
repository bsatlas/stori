{
  namespace:: {
    name: 'namespace',
    'in': 'path',
    description: 'A logical grouping of repositories.',
    required: true,
    deprecated: false,
    allowEmptyValue: false,
    schema: { type: 'string' },
  },

  repository:: {
    name: 'repository',
    'in': 'path',
    description: 'A place to store an image.',
    required: true,
    deprecated: false,
    allowEmptyValue: false,
    schema: { type: 'string' },
  },

  reference:: {
    name: 'reference',
    'in': 'path',
    description: 'Can either be a tag name or digest.',
    required: true,
    deprecated: false,
    allowEmptyValue: false,
    schema: { type: 'string' },
  },

  digest:: {
    name: 'digest',
    'in': 'path',
    description: 'A content addressable identifier.',
    required: true,
    deprecated: false,
    allowEmptyValue: false,
    schema: { type: 'string' },
  },

  tag:: {
    name: 'tag',
    'in': 'path',
    description: 'An image tag.',
    required: true,
    deprecated: false,
    allowEmptyValue: false,
    schema: { type: 'string' },
  },

  id:: {
    name: 'id',
    'in': 'path',
    description: 'A unique id.',
    required: true,
    deprecated: false,
    allowEmptyValue: false,
    schema: { type: 'string' },
  },
}
