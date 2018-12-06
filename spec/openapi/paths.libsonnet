local ops = import 'operations.libsonnet';

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
  uploadId:: '/v2/{namespace}/{repository}/blobs/uploads/{id}',
};

local params = {
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

  id:: {
    name: 'id',
    'in': 'path',
    description: 'A unique id.',
    required: true,
    deprecated: false,
    allowEmptyValue: false,
    schema: { type: 'string' },
  },
};

{
  [stori.base]: {
    head: ops.stori.base,
  },

  [stori.namespaces]: {
    get: ops.stori.getNamespaces,
    delete: ops.stori.deleteNamespaces,
    parameters: [],
  },

  [stori.namespace]: {
    get: ops.stori.getNamespace,
    put: ops.stori.createNamespace,
    delete: ops.stori.deleteNamespace,
    parameters: ['namespace'],
  },

  [stori.repositories]: {
    get: ops.stori.getRepositories,
    delete: ops.stori.deleteRepositories,
    parameters: ['namespace'],
  },

  [stori.repository]: {
    get: ops.stori.getRepository,
    delete: ops.stori.deleteRepository,
    put: ops.stori.createRepository,
    head: ops.stori.headRepository,
    parameters: ['namespace', 'repository'],
  },

  [stori.manifests]: {
    get: ops.stori.getManifests
    parameters: ['namespace', 'repository'],
  },

  [stori.manifest]: {
    get: {},
    delete: {},
    put: {},
    parameters: ['namespace', 'repository', 'digest'],
  },

  [stori.config]: {
    get: {},
    parameters: ['namespace', 'repository', 'digest'],
  },

  [stori.tags]: {
    get: {},
    delete: {},
    parameters: ['namespace', 'repository'],
  },

  [stori.tag]: {
    get: {},
    delete: {},
    put: {},
    parameters: ['namespace', 'repository', 'tag'],
  },

  [stori.blobs]: {
    get: {},
    parameters: ['namespace', 'repository'],
  },

  [stori.blob]: {
    get: {},
    put: {},
    delete: {},
    head: {},
    parameters: ['namespace', 'repository', 'blob'],
  },

  // OCI paths.
  [oci.base]: {
    get: ops.oci.base,
  },

  [oci.tags]: {
    get: ops.oci.tags,
    parameters: [
      params.namespace,
      params.repository,
    ],
  },

  [oci.catalog]: {
    get: ops.oci.catalog,
  },

  [oci.manifest]: {
    get: ops.oci.getManifest,
    put: ops.oci.putManifest,
    delete: ops.oci.deleteManifest,
    parameters: [
      params.namespace,
      params.repository,
      params.reference,
    ],
  },

  [oci.blob]: {
    get: ops.oci.getBlob,
    delete: ops.oci.deleteBlob,
    parameters: [
      params.namespace,
      params.repository,
      params.digest,
    ],
  },

  [oci.upload]: {
    post: ops.oci.initBlobUploadOrMount,
    parameters: [
      params.namespace,
      params.repository,
    ],
  },

  [oci.uploadId]: {
    get: ops.oci.statusBlobUpload,
    patch: ops.oci.uploadBlobChunk,
    put: ops.oci.uploadBlobComplete,
    delete: ops.oci.deleteBlob,
    parameters: [
      params.namespace,
      params.repository,
      params.id,
    ],
  },
}
