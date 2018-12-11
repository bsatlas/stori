{
  // Initialize new Request Body object.
  new(
    content=error 'Content not defined for Request Body object.',
    required=false,
    description=null,
  ):: {
    required: required,
    [if description != null then 'description']: description,
  },
}
