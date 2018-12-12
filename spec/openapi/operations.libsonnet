local oapi = import 'openapi-jsonnet/v3.0.0/openapi.libsonnet';

local op = oapi.operation;

// OCI Operations.
local oci = {

  local tags = ['OCI'],

  local verify = op.new(
    operationId='oci-verify',
    tags=tags,
    summary='Check that the endpoint implements distribution API.',
    description='This minimal endpoint is used to verify that the registry implements the OCI Distribution Specification.',
  ),

  local catalogList = op.new(
    operationId='oci-catalog-list',
    tags=tags,
    summary='List a set of available repositories in the local registry cluster.',
    description='List a set of available repositories in the local registry cluster. Does not provide any indication of what may be available upstream. Applications can only determine if a repository is available but not if it is not available.',
  ),

  local tagsList = op.new(
    operationId='oci-tags-list',
    tags=tags,
    summary='Get all tags in a repository.',
  ),

  local manifestGet = op.new(
    operationId='oci-manifest-get',
    summary='Get a manifest by name and reference.',
    tags=tags,
  ),

  local manifestExists = op.new(
    operationId='oci-manifest-exists',
    summary='Check for the existence of a manifest by name and reference.',
    tags=tags,
  ),

  local manifestCreate = op.new(
    operationId='oci-manifest-create',
    summary='Add a manifest to a repository.',
    tags=tags,
  ),

  local manifestDelete = op.new(
    operationId='oci-manifest-delete',
    summary='Delete a manifest from the repository.',
    tags=tags,
  ),

  local blobDownload = op.new(
    operationId='oci-blob-download',
    summary='Download a blob by digest.',
    tags=tags,
  ),

  local blobExists = op.new(
    operationId='oci-blob-exists',
    summary='Check for the existence of a manifest by name and reference.',
  ),

  local blobDelete = op.new(
    operationId='oci-blob-delete',
    tags=tags,
    summary='Delete a blob by digest.',
  ),

  local blobUploadInit = op.new(
    operationId='oci-blob-upload-init',
    tags=tags,
    summary='Initiate a blob upload.',
  ),

  local blobUploadStatus = op.new(
    operationId='oci-blob-upload-status',
    tags=tags,
    summary="Check a blob's upload status.",
  ),

  local blobUploadChunk = op.new(
    operationId='oci-blob-upload-chunk',
    tags=tags,
    summary='Upload a blob chunk to the repository.',
  ),

  local blobUploadComplete = op.new(
    operationId='oci-blob-upload-complete',
    tags=tags,
    summary='Notify registry that the chunked blob upload is complete.',
  ),

  local blobUploadCancel = op.new(
    operationId='oci-blob-upload-cancel',
    tags=tags,
    summary='Cancel the chunked blob upload.',
  ),

  verify:: verify,
  catalogList:: catalogList,
  tagsList:: tagsList,
  manifestGet:: manifestGet,
  manifestExists:: manifestExists,
  manifestCreate:: manifestCreate,
  manifestDelete:: manifestDelete,
  blobDownload:: blobDownload,
  blobExists:: blobExists,
  blobDelete:: blobDelete,
  blobUploadInit:: blobUploadInit,
  blobUploadStatus:: blobUploadStatus,
  blobUploadChunk:: blobUploadChunk,
  blobUploadComplete:: blobUploadComplete,
  blobUploadCancel:: blobUploadCancel,
};


{
  oci: oci,
}
