{
  stori:: {
  },

  oci:: {

    base:: {
      tags: ['OCI'],
      summary: 'Check that the endpoint implements distribution API.',
      operationId: 'oci-base',
    },

    catalog:: {
      tags: ['OCI'],
      summary: 'List a set of available repositories in the local registry cluster.',
      operationId: 'oci-catalog',
    },

    tags:: {
      tags: ['OCI'],
      summary: 'Get all tags in a repository.',
      operationId: 'oci-tags-list',
    },

    getManifest:: {
      tags: ['OCI'],
      summary: 'Get a manifest by name and reference.',
      operationId: 'oci-get-manifest',
    },

    putManifest:: {
      tags: ['OCI'],
      summary: 'Add a manifest to a repository.',
      operationId: 'oci-put-manifest',
    },

    deleteManifest:: {
      tags: ['OCI'],
      summary: 'Delete a manifest from the repository.',
      operationId: 'oci-delete-manifest',
    },

    getBlob:: {
      tags: ['OCI'],
      summary: 'Download a blob by digest.',
      operationId: 'oci-get-blob',
    },

    deleteBlob:: {
      tags: ['OCI'],
      summary: 'Delete a blob by digest.',
      operationId: 'oci-delete-blob',
    },

    initBlobUploadOrMount:: {
      tags: ['OCI'],
      summary: 'Initiate a blob upload.',
      operationId: 'oci-init-blob-upload',
    },

    statusBlobUpload:: {
      tags: ['OCI'],
      summary: "Check a blob's upload status.",
      operationId: 'oci-status-blob-upload',
    },

    uploadBlobChunk:: {
      tags: ['OCI'],
      summary: 'Upload a blob chunk to the registry.',
      operationId: 'oci-upload-blob-chunk',
    },

    uploadBlobComplete:: {
      tags: ['OCI'],
      summary: 'Notify registry that the chunked blob upload is complete.',
      operationId: 'oci-upload-blob-complete',
    },

    cancelBlobUpload:: {
      tags: ['OCI'],
      summary: 'Cancel a blob upload.',
      operationId: 'oci-cancel-blob-upload',
    },

    mountBlob:: {
      tags: ['OCI'],
      summary: 'Mount a blob from another repository.',
      operationId: 'oci-mount-blob',
    },
  },
}
