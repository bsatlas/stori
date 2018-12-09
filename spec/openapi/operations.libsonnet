local resp = import 'responses.libsonnet';
{
  stori:: {
    base:: {
      tags: ['Images'],
      summary: 'Verify that the endpoint implements the Stori API Specification.',
      operationId: 'images-base',
      responses:
        resp.errors.unauthorized
        + resp.errors.notFound,
    },

    getNamespaces:: {
      tags: ['Images', 'Namespaces'],
      summary: 'Get all namespaces the client has access to.',
      operationId: 'get-namespaces',
      responses: {},
    },

    deleteNamespaces:: {
      tags: ['Images', 'Namespaces'],
      summary: 'Delete all namespaces in the registry.',
      description: 'This operation deletes all namespaces and repositories hosted on the registry. Use with caution as it is very destructive.',
      operationId: 'get-namespaces',
      responses: {},
    },

    getNamespace:: {
      tags: ['Images', 'Namespaces'],
      summary: 'Get info about a specific namespace.',
      operationId: 'get-namespaces',
      responses: {},
    },

    createNamespace:: {
      tags: ['Images', 'Namespaces'],
      summary: 'Create a new namespace',
      description: 'This operation creates an new namespace for storing image repositories.',
      operationId: 'create-namespace',
      responses: {},
    },

    deleteNamespace:: {
      tags: ['Images', 'Namespaces'],
      summary: 'Delete a namespace.',
      description: 'This operation deletes a namespace from the registry as well as all repositories it contains.',
      operationId: 'create-namespace',
      responses: {},
    },

    getRepositories:: {
      tags: ['Images', 'Repositories'],
      summary: 'Get info about a specific repository.',
      operationId: 'get-repositories',
      responses: {},
    },

    deleteRepositories:: {
      tags: ['Images', 'Repositories'],
      summary: 'Delete all repositories in a namespace.',
      operationId: 'delete-repositories',
      responses: {},
    },

    getRepository:: {
      tags: ['Images', 'Repositories'],
      summary: 'Get info about a specific repository.',
      operationId: 'get-repository',
      responses: {},
    },

    deleteRepository:: {
      tags: ['Images', 'Repositories'],
      summary: 'Delete a repository from a namespace.',
      operationId: 'delete-repository',
      responses: {},
    },

    createRepository:: {
      tags: ['Images', 'Repositories'],
      summary: 'Create a new repository.',
      operationId: 'create-repository',
      responses: {},
    },

    verifyRepository:: {
      tags: ['Images', 'Repositories'],
      summary: 'Check if a specific repository exists.',
      operationId: 'verify-repository',
      responses: {},
    },

    getManifests:: {
      tags: ['Images', 'Manifests'],
      summary: 'Get all manifests in a repository.',
      operationId: 'get-manifests',
      responses: {},
    },

    getManifest:: {
      tags: ['Images', 'Manifests'],
      summary: 'Get an image manifest.',
      operationId: 'get-manifest',
      responses: {},
    },

    deleteManifest:: {
      tags: ['Images', 'Manifests'],
      summary: 'Delete an image manifest.',
      operationId: 'delete-manifest',
      responses: {},
    },

    setManifest:: {
      tags: ['Images', 'Manifests'],
      summary: 'Mark an uploaded blob as an image manifest.',
      operationId: 'set-manifest',
      responses: {},
    },

    getManifestConfig:: {
      tags: ['Images', 'Manifests'],
      summary: "Get an image manifest's config info.",
      operationId: 'get-manifest-config',
      responses: {},
    },

    getTags:: {
      tags: ['Images', 'Manifests'],
      summary: 'Get all tags in a repository',
      operationId: 'get-tags',
      responses: {},
    },

    deleteTags:: {
      tags: ['Images', 'Manifests'],
      summary: 'Delete all tags in a repository',
      operationId: 'delete-tags',
      responses: {},
    },

    getTag:: {
      tags: ['Images', 'Manifests'],
      summary: 'Get a repository tag.',
      operationId: 'get-tag',
      responses: {},
    },

    deleteTag:: {
      tags: ['Images', 'Manifests'],
      summary: 'Delete a repository tag.',
      operationId: 'delete-tag',
      responses: {},
    },

    createTag:: {
      tags: ['Images', 'Manifests'],
      summary: 'Create a new repository tag.',
      operationId: 'create-tag',
      responses: {},
    },

    getBlobs:: {
      tags: ['Images', 'Blobs'],
      summary: 'Get a list of all Blobs in a repository.',
      operationId: 'get-Blobs',
      responses: {},
    },

    getBlob:: {
      tags: ['Images', 'Blobs'],
      summary: 'Download a blob from a repository.',
      operationId: 'get-blob',
      responses: {},
    },

    uploadBlob:: {
      tags: ['Images', 'Blobs'],
      summary: 'Upload a blob to a repository.',
      operationId: 'upload-blob',
      responses: {},
    },

    deleteBlob:: {
      tags: ['Images', 'Blobs'],
      summary: 'Delete a blob from a repository.',
      operationId: 'delete-blob',
      responses: {},
    },

    verifyBlob:: {
      tags: ['Images', 'Blobs'],
      summary: 'Verify that a blob exists in a repository.',
      operationId: 'verify-blob',
      responses: {},
    },

  },

  oci:: {

    base:: {
      tags: ['OCI'],
      summary: 'Check that the endpoint implements distribution API.',
      description: 'This minimal endpoint is used to verify that the registry implements the OCI Distribution Specification.',
      operationId: 'oci-base',
      responses:
        resp.errors.unauthorized
        + resp.errors.forbidden
        + resp.errors.notFound
        + resp.errors.tooManyRequests,
    },

    catalog:: {
      tags: ['OCI'],
      summary: 'List a set of available repositories in the local registry cluster.',
      description: 'List a set of available repositories in the local registry cluster. Does not provide any indication of what may be available upstream. Applications can only determine if a repository is available but not if it is not available.',
      operationId: 'oci-catalog',
      responses:
        resp.errors.unauthorized
        + resp.errors.forbidden
        + resp.errors.tooManyRequests,
    },

    tags:: {
      tags: ['OCI'],
      summary: 'Get all tags in a repository.',
      operationId: 'oci-tags-list',
      responses:
        resp.errors.unauthorized
        + resp.errors.forbidden
        + resp.errors.tooManyRequests,
    },

    getManifest:: {
      tags: ['OCI'],
      summary: 'Get a manifest by name and reference.',
      operationId: 'oci-get-manifest',
      responses:
        resp.errors.notFound
        + resp.errors.unauthorized
        + resp.errors.forbidden
        + resp.errors.tooManyRequests,
    },

    checkManifest:: {
      tags: ['OCI'],
      summary: 'Check for the existence of a manifest by name and reference.',
      operationId: 'oci-get-manifest',
      responses:
        resp.errors.notFound
        + resp.errors.unauthorized
        + resp.errors.forbidden
        + resp.errors.tooManyRequests,
    },

    putManifest:: {
      tags: ['OCI'],
      summary: 'Add a manifest to a repository.',
      operationId: 'oci-put-manifest',
      responses:
        resp.errors.unauthorized
        + resp.errors.forbidden
        + resp.errors.tooManyRequests,
    },

    deleteManifest:: {
      tags: ['OCI'],
      summary: 'Delete a manifest from the repository.',
      operationId: 'oci-delete-manifest',
      responses:
        resp.errors.unauthorized
        + resp.errors.forbidden
        + resp.errors.notFound
        + resp.errors.tooManyRequests,
    },

    getBlob:: {
      tags: ['OCI'],
      summary: 'Download a blob by digest.',
      operationId: 'oci-get-blob',
      responses:
        resp.common.temporaryRedirect
        + resp.errors.unauthorized
        + resp.errors.forbidden
        + resp.errors.notFound
        + resp.errors.tooManyRequests,
    },

    checkBlob:: {
      tags: ['OCI'],
      summary: 'Check for the existence of a blob by digest.',
      operationId: 'oci-get-blob',
      responses:
        resp.errors.unauthorized
        + resp.errors.forbidden
        + resp.errors.notFound
        + resp.errors.tooManyRequests,
    },

    deleteBlob:: {
      tags: ['OCI'],
      summary: 'Delete a blob by digest.',
      operationId: 'oci-delete-blob',
      responses:
        resp.common.accepted
        + resp.errors.unauthorized
        + resp.errors.forbidden
        + resp.errors.notFound
        + resp.errors.tooManyRequests,
    },

    initBlobUploadOrMount:: {
      tags: ['OCI'],
      summary: 'Initiate a blob upload.',
      operationId: 'oci-init-blob-upload',
      responses:
        resp.common.accepted
        + resp.errors.unauthorized
        + resp.errors.forbidden
        + resp.errors.tooManyRequests,
    },

    statusBlobUpload:: {
      tags: ['OCI'],
      summary: "Check a blob's upload status.",
      operationId: 'oci-status-blob-upload',
      responses:
        resp.common.noContent
        + resp.errors.unauthorized
        + resp.errors.forbidden
        + resp.errors.tooManyRequests,
    },

    uploadBlobChunk:: {
      tags: ['OCI'],
      summary: 'Upload a blob chunk to the registry.',
      operationId: 'oci-upload-blob-chunk',
      responses:
        resp.errors.RangeNotSatisfiable
        + resp.errors.unauthorized
        + resp.errors.forbidden
        + resp.common.accepted
        + resp.errors.tooManyRequests,
    },

    uploadBlobComplete:: {
      tags: ['OCI'],
      summary: 'Notify registry that the chunked blob upload is complete.',
      operationId: 'oci-upload-blob-complete',
      responses:
        resp.common.created
        + resp.errors.unauthorized
        + resp.errors.forbidden
        + resp.errors.tooManyRequests,
    },

    cancelBlobUpload:: {
      tags: ['OCI'],
      summary: 'Cancel a blob upload.',
      operationId: 'oci-cancel-blob-upload',
      responses:
        resp.errors.unauthorized
        + resp.errors.forbidden
        + resp.errors.tooManyRequests,
    },

    mountBlob:: {
      tags: ['OCI'],
      summary: 'Mount a blob from another repository.',
      operationId: 'oci-mount-blob',
      responses:
        resp.common.created
        + resp.common.accepted
        + resp.errors.unauthorized
        + resp.errors.forbidden
        + resp.errors.tooManyRequests,
    },
  },
}
