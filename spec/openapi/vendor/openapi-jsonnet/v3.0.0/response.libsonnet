{
  // Initialize new Response object.
  new(
    description=null,
  ):: {
    [if description != null then 'description']: description,

    addHeader(headers):: self {
      headers+: headers,
    },

    addContent(mediaType):: self {
      content+: mediaType,
    },
  },
}
