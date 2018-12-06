{
  stori:: {
    base:: {
      tags: ['images'],
      summary: 'Check that the endpoint implements distribution API.',
      operationId: 'images-base',
      responses: {},
    },

    getNamespaces:: {
      tags: ['images', 'namespaces'],
      summary: 'Get all namespaces the client has access to.',
      operationId: 'get-namespaces',
      responses: {},
    },

    deleteNamespaces:: {
      tags: ['images', 'namespaces'],
      summary: 'Delete all namespaces in the registry.',
      description: 'This operation deletes all namespaces and repositories hosted on the registry. Use with caution as it is very destructive.',
      operationId: 'get-namespaces',
      responses: {},
    },

    getNamespace:: {
      tags: ['images', 'namespaces'],
      summary: 'Get info about a specific namespace.',
      operationId: 'get-namespaces',
      responses: {},
    },

    createNamespace:: {
      tags: ['images', 'namespaces'],
      summary: 'Create a new namespace',
      description: 'This operation creates an new namespace for storing image repositories.',
      operationId: 'create-namespace',
      responses: {},
    },

    deleteNamespace:: {
      tags: ['images', 'namespaces'],
      summary: 'Delete a namespace.',
      description: 'This operation deletes a namespace from the registry as well as all repositories it contains.',
      operationId: 'create-namespace',
      responses: {},
    },

    getRepositories:: {
      tags: ['images', 'repositories'],
      summary: 'Get info about a specific repository.',
      operationId: 'get-repositories',
      responses: {},
    },

    deleteRepositories:: {
      tags: ['images', 'repositories'],
      summary: 'Delete all repositories in a namespace.',
      operationId: 'delete-repositories',
      responses: {},
    },

    getRepository:: {
      tags: ['images', 'repositories'],
      summary: 'Get info about a specific repository.',
      operationId: 'get-repository',
      responses: {},
    },

    deleteRepository:: {
      tags: ['images', 'repositories'],
      summary: 'Delete a repository from a namespace.',
      operationId: 'delete-repository',
      responses: {},
    },

    createRepository:: {
      tags: ['images', 'repositories'],
      summary: 'Create a new repository.',
      operationId: 'create-repository',
      responses: {},
    },

    headRepository:: {
      tags: ['images', 'repositories'],
      summary: 'Check if a specific repository exists.',
      operationId: 'head-repository',
      responses: {},
    },

    getManifests:: {
      tags: ['images', 'manifests'],
      summary: 'Get all manifests in a repository.',
      operationId: 'get-manifests',
      responses: {},
    },

    getManifest:: {
      tags: ['images', 'manifests'],
      summary: 'Get an image manifest.',
      operationId: 'get-manifest',
      responses: {},
    },

    deleteManifest:: {
      tags: ['images', 'manifests'],
      summary: 'Delete an image manifest.',
      operationId: 'delete-manifest',
      responses: {},
    },

    setManifest:: {
      tags: ['images', 'manifests'],
      summary: 'Mark an uploaded blob as an image manifest.',
      operationId: 'set-manifest',
      responses: {},
    },

    getManifestConfig:: {
      tags: ['images', 'manifests'],
      summary: "Get an image manifest's config info.",
      operationId: 'get-manifest-config',
      responses: {},
    },

    getTags:: {
      tags: ['images', 'manifests'],
      summary: 'Get all tags in a repository',
      operationId: 'get-tags',
      responses: {},
    },

    deleteTags:: {
      tags: ['images', 'manifests'],
      summary: 'Delete all tags in a repository',
      operationId: 'delete-tags',
      responses: {},
    },

    getTag:: {
      tags: ['images', 'manifests'],
      summary: 'Get a repository tag.',
      operationId: 'get-tag',
      responses: {},
    },

    deleteTag:: {
      tags: ['images', 'manifests'],
      summary: 'Delete a repository tag.',
      operationId: 'delete-tag',
      responses: {},
    },

    createTag:: {
      tags: ['images', 'manifests'],
      summary: 'Create a new repository tag.',
      operationId: 'create-tag',
      responses: {},
    },

    getBlob:: {
      tags: ['images', 'blobs'],
      summary: 'Download a blob from a repository.',
      operationId: 'create-tag',
      responses: {},
    },

  },

  oci:: {

    base:: {
      tags: ['OCI'],
      summary: 'Check that the endpoint implements distribution API.',
      description: 'This minimal endpoint is used to verify that the registry implements the OCI Distribution Specification.',
      operationId: 'oci-base',
      responses: {},
    },

    catalog:: {
      tags: ['OCI'],
      summary: 'List a set of available repositories in the local registry cluster.',
      description: 'List a set of available repositories in the local registry cluster. Does not provide any indication of what may be available upstream. Applications can only determine if a repository is available but not if it is not available.',
      operationId: 'oci-catalog',
      responses: {},
    },

    tags:: {
      tags: ['OCI'],
      summary: 'Get all tags in a repository.',
      operationId: 'oci-tags-list',
      responses: {},
    },

    getManifest:: {
      tags: ['OCI'],
      summary: 'Get a manifest by name and reference.',
      operationId: 'oci-get-manifest',
      responses: {},
    },

    putManifest:: {
      tags: ['OCI'],
      summary: 'Add a manifest to a repository.',
      operationId: 'oci-put-manifest',
      responses: {},
    },

    deleteManifest:: {
      tags: ['OCI'],
      summary: 'Delete a manifest from the repository.',
      operationId: 'oci-delete-manifest',
      responses: {},
    },

    getBlob:: {
      tags: ['OCI'],
      summary: 'Download a blob by digest.',
      operationId: 'oci-get-blob',
      responses: {},
    },

    deleteBlob:: {
      tags: ['OCI'],
      summary: 'Delete a blob by digest.',
      operationId: 'oci-delete-blob',
      responses: {},
    },

    initBlobUploadOrMount:: {
      tags: ['OCI'],
      summary: 'Initiate a blob upload.',
      operationId: 'oci-init-blob-upload',
      responses: {},
    },

    statusBlobUpload:: {
      tags: ['OCI'],
      summary: "Check a blob's upload status.",
      operationId: 'oci-status-blob-upload',
      responses: {},
    },

    uploadBlobChunk:: {
      tags: ['OCI'],
      summary: 'Upload a blob chunk to the registry.',
      operationId: 'oci-upload-blob-chunk',
      responses: {},
    },

    uploadBlobComplete:: {
      tags: ['OCI'],
      summary: 'Notify registry that the chunked blob upload is complete.',
      operationId: 'oci-upload-blob-complete',
      responses: {},
    },

    cancelBlobUpload:: {
      tags: ['OCI'],
      summary: 'Cancel a blob upload.',
      operationId: 'oci-cancel-blob-upload',
      responses: {},
    },

    mountBlob:: {
      tags: ['OCI'],
      summary: 'Mount a blob from another repository.',
      operationId: 'oci-mount-blob',
      responses: {},
    },
  },
}
