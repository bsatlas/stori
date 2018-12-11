{
  // Initialize new Media Type object.
  new(
    name=error 'Name not defined for Media Type object.',
    schema=error 'Schema not defined for Media Type object.',
  ):: {
    [name]: {
      schema: schema,
    },

    addExample(example):: self {
      [name]+: {
        examples+: example,
      },
    },

    addEncoding(encoding):: self {
      [name]+: {
        encoding+: encoding,
      },
    },
  },
}
