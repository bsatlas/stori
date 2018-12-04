local stori = {
  base:: '/images',
  namespaces:: '/images/namespaces',
  namespace:: '/images/namespaces/{namespace}',
  repositories:: '/images/namespaces/{namespace}/repositories',
  repository:: '/images/namespaces/{namespace}/repositories/{repository}',
  manifests:: '/images/namespaces/{namespace}/repositories/{repository}/manifests',
  manifest:: '/images/namespaces/{namespace}/repositories/{repository}/manifests/{digest}',
  config:: '/images/namespaces/{namespace}/repositories/{repository}/manifests/{digest}/config',
  tags:: '/images/namespaces/{namespace}/repositories/{repository}/tags',
  tag:: '/images/namespaces/{namespace}/repositories/{repository}/tags/{tag}',
  blobs:: '/images/namespaces/{namespace}/repositories/{repository}/blobs',
  blob:: '/images/namespaces/{namespace}/repositories/{repository}/blobs/{digest}',
};

local oci = {
  base:: '/v2',
  catalog:: '/v2/_catalog',
  tags:: '/v2/{namespace}/{repository}/tags/list',
  manifest:: '/v2/{namespace}/{repository}/manifests/{reference}',
  blob:: '/v2/{namespace}/{repository}/blobs/{digest}',
  upload:: '/v2/{namespace}/{repository}/blobs/uploads',
  uploadId:: '/v2/{namespace}/{repository}/blobs/uploads/{uuid}',
};
{
  [stori.base]: {
    summary: '',
    description: '',
    head: {},
  },

  [stori.namespaces]: {
    summary: '',
    description: '',
    get: {},
    delete: {},
    parameters: [],
  },

  [stori.namespace]: {
    summary: '',
    description: '',
    get: '',
    put: '',
    delete: '',
    parameters: [],
  },

  [stori.repositories]: {
    summary: '',
    description: '',
    get: {},
    delete: {},
    parameters: [],
  },

  [stori.repository]: {
    summary: '',
    description: '',
    get: {},
    delete: {},
    put: {},
    head: {},
    parameters: [],
  },

  [stori.manifests]: {
    summary: '',
    description: '',
    get: {},
    parameters: [],
  },

  [stori.manifest]: {
    summary: '',
    description: '',
    get: {},
    delete: {},
    put: {},
    parameters: [],
  },

  [stori.config]: {
    summary: '',
    description: '',
    get: {},
    parameters: [],
  },

  [stori.tags]: {
    summary: '',
    description: '',
    get: {},
    delete: {},
    parameters: [],
  },

  [stori.tag]: {
    summary: '',
    description: '',
    get: {},
    delete: {},
    put: {},
    parameters: [],
  },

  [stori.blobs]: {
    summary: '',
    description: '',
    get: {},
    parameters: [],
  },

  [stori.blob]: {
    summary: '',
    description: '',
    get: {},
    put: {},
    delete: {},
    head: {},
    parameters: [],
  },

  // OCI paths.
  [oci.base]: {
    summary: '',
    description: '',
    get: {},
    parameters: [],
  },

  [oci.tags]: {
    summary: '',
    description: '',
    get: {},
    parameters: [],
  },

  [oci.catalog]: {
    summary: '',
    description: '',
    get: {},
    parameters: [],
  },

  [oci.manifest]: {
    summary: '',
    description: '',
    get: {},
    put: {},
    delete: {},
    parameters: [],
  },

  [oci.blob]: {
    summary: '',
    description: '',
    get: {},
    delete: {},
    parameters: [],
  },

  [oci.upload]: {
    summary: '',
    description: '',
    post: {},
    parameters: [],
  },

  [oci.uploadId]: {
    summary: '',
    description: '',
    get: {},
    patch: {},
    put: {},
    delete: {},
    parameters: [],
  },
}
