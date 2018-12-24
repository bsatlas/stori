package http

import (
	"net/http"

	"github.com/atlaskerr/stori/stori"

	"github.com/julienschmidt/httprouter"
)

// OCIHandler returns an http.Handler for the API. This can be used on its own
// to mount an OCI-compliant image registry within another web server.
func OCIHandler(props *stori.HandlerProperties) http.Handler {
	reg := props.Registry

	h := httprouter.New()

	// Base endpoint
	h.Handler(
		"GET",
		"/v2",
		handleOCIVerify(reg),
	)

	// Catalog
	h.Handler(
		"GET",
		"/v2/:namespace",
		handleOCICatalogList(reg),
	)

	// Tags list
	h.Handler(
		"GET",
		"/v2/:namespace/:repository/tags/list",
		handleOCITagsList(reg),
	)

	// Manifest get
	h.Handler(
		"GET",
		"/v2/:namespace/:repository/manifests/:reference",
		handleOCIManifestGet(reg),
	)

	// Manifest exists
	h.Handler(
		"HEAD",
		"/v2/:namespace/:repository/manifests/:reference",
		handleOCIManifestExists(reg),
	)

	// Manifest put
	h.Handler(
		"PUT",
		"/v2/:namespace/:repository/manifests/:reference",
		handleOCIManifestPut(reg),
	)

	// Manifest delete
	h.Handler(
		"DELETE",
		"/v2/:namespace/:repository/manifests/:reference",
		handleOCIManifestDelete(reg),
	)

	// Blob get
	h.Handler(
		"GET",
		"/v2/:namespace/:repository/blobs/:digest",
		handleOCIBlobGet(reg),
	)

	// Blob exists
	h.Handler(
		"HEAD",
		"/v2/:namespace/:repository/blobs/:digest",
		handleOCIBlobExists(reg),
	)

	// Blob delete
	h.Handler(
		"DELETE",
		"/v2/:namespace/:repository/blobs/:digest",
		handleOCIBlobDelete(reg),
	)

	// Blob upload init
	h.Handler(
		"POST",
		"/v2/:namespace/:repository/blobs/:digest",
		handleOCIBlobUploadInit(reg),
	)

	// Blob upload status
	h.Handler(
		"GET",
		"/v2/:namespace/:repository/blobs/:digest/:uuid",
		handleOCIBlobUploadStatus(reg),
	)

	// Blob upload chunk
	h.Handler(
		"PATCH",
		"/v2/:namespace/:repository/blobs/:digest/:uuid",
		handleOCIBlobUploadChunk(reg),
	)

	// Blob upload complete
	h.Handler(
		"PUT",
		"/v2/:namespace/:repository/blobs/:digest/:uuid",
		handleOCIBlobUploadComplete(reg),
	)

	// Blob upload cancel
	h.Handler(
		"DELETE",
		"/v2/:namespace/:repository/blobs/:digest/:uuid",
		handleOCIBlobUploadCancel(reg),
	)
	return h
}
