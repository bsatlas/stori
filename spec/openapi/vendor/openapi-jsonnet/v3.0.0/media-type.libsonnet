{
  // Initialize new Media Type object.
  new(
    schema=error 'Schema not defined for Media Type object.',
  ):: {
    schema: schema,

    addExample(example):: self {
      examples+: example,
    },

    addEncoding(encoding):: self {
      encoding+: encoding,
    },
  },
}
