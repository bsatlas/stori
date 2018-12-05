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
  uploadId:: '/v2/{namespace}/{repository}/blobs/uploads/{uuid}',
};
{
  [stori.base]: {
    summary: "Stori's base path for images",
    description: 'This minimal endpoint is used to get information about Stori.',
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
    parameters: ['namespace'],
  },

  [stori.repositories]: {
    summary: '',
    description: '',
    get: {},
    delete: {},
    parameters: ['namespace'],
  },

  [stori.repository]: {
    summary: '',
    description: '',
    get: {},
    delete: {},
    put: {},
    head: {},
    parameters: ['namespace', 'repository'],
  },

  [stori.manifests]: {
    summary: '',
    description: '',
    get: {},
    parameters: ['namespace', 'repository'],
  },

  [stori.manifest]: {
    summary: '',
    description: '',
    get: {},
    delete: {},
    put: {},
    parameters: ['namespace', 'repository', 'digest'],
  },

  [stori.config]: {
    summary: '',
    description: '',
    get: {},
    parameters: ['namespace', 'repository', 'digest'],
  },

  [stori.tags]: {
    summary: '',
    description: '',
    get: {},
    delete: {},
    parameters: ['namespace', 'repository'],
  },

  [stori.tag]: {
    summary: '',
    description: '',
    get: {},
    delete: {},
    put: {},
    parameters: ['namespace', 'repository', 'tag'],
  },

  [stori.blobs]: {
    summary: '',
    description: '',
    get: {},
    parameters: ['namespace', 'repository'],
  },

  [stori.blob]: {
    summary: '',
    description: '',
    get: {},
    put: {},
    delete: {},
    head: {},
    parameters: ['namespace', 'repository', 'blob'],
  },

  // OCI paths.
  [oci.base]: {
    summary: 'OCI distribution check.',
    description: 'This minimal endpoint is used to verify that the registry implements the OCI Distribution Specification.',
    get: ops.oci.base,
  },

  [oci.tags]: {
    summary: 'Retrieve information about tags.',
    get: ops.oci.tags,
    parameters: ['namespace', 'repository'],
  },

  [oci.catalog]: {
    summary: 'List all repositories.',
    description: 'List a set of available repositories in the local registry cluster. Does not provide any indication of what may be available upstream. Applications can only determine if a repository is available but not if it is not available.',
    get: ops.oci.catalog,
  },

  [oci.manifest]: {
    summary: '',
    description: '',
    get: ops.oci.getManifest,
    put: ops.oci.putManifest,
    delete: ops.oci.deleteManifest,
    parameters: ['namespace', 'repository', 'reference'],
  },

  [oci.blob]: {
    summary: '',
    description: '',
    get: ops.oci.getBlob,
    delete: ops.oci.deleteBlob,
    parameters: ['namespace', 'repository', 'digest'],
  },

  [oci.upload]: {
    summary: '',
    description: '',
    post: ops.oci.initBlobUploadOrMount,
    parameters: ['namespace', 'repository'],
  },

  [oci.uploadId]: {
    summary: '',
    description: '',
    get: ops.oci.statusBlobUpload,
    patch: ops.oci.uploadBlobChunk,
    put: ops.oci.uploadBlobComplete,
    delete: ops.oci.deleteBlob,
    parameters: ['namespace', 'repository', 'uuid'],
  },
}
