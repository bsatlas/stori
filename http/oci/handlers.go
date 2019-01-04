// Copyright © 2018 Atlas Kerr atlaskerr@gmail.com
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

package oci

// Handler returns an http.Handler for the API. This can be used on its own
// to mount an OCI-compliant image registry within another web server.
func Handler(props *stori.HandlerProperties) http.Handler {
	reg := props.Registry

	h := httprouter.New()

	// Base endpoint
	h.Handler(
		"GET",
		"/v2",
		httpoci.handleOCIVerify(reg),
	)

	// Catalog
	h.Handler(
		"GET",
		"/v2/:namespace",
		httpoci.handleOCICatalogList(reg),
	)

	// Tags list
	h.Handler(
		"GET",
		"/v2/:namespace/:repository/tags/list",
		httpoci.handleOCITagsList(reg),
	)

	// Manifest get
	h.Handler(
		"GET",
		"/v2/:namespace/:repository/manifests/:reference",
		httpoci.handleOCIManifestGet(reg),
	)

	// Manifest exists
	h.Handler(
		"HEAD",
		"/v2/:namespace/:repository/manifests/:reference",
		httpoci.handleOCIManifestExists(reg),
	)

	// Manifest put
	h.Handler(
		"PUT",
		"/v2/:namespace/:repository/manifests/:reference",
		httpoci.handleOCIManifestPut(reg),
	)

	// Manifest delete
	h.Handler(
		"DELETE",
		"/v2/:namespace/:repository/manifests/:reference",
		httpoci.handleOCIManifestDelete(reg),
	)

	// Blob get
	h.Handler(
		"GET",
		"/v2/:namespace/:repository/blobs/:digest",
		httpoci.handleOCIBlobGet(reg),
	)

	// Blob exists
	h.Handler(
		"HEAD",
		"/v2/:namespace/:repository/blobs/:digest",
		httpoci.handleOCIBlobExists(reg),
	)

	// Blob delete
	h.Handler(
		"DELETE",
		"/v2/:namespace/:repository/blobs/:digest",
		httpoci.handleOCIBlobDelete(reg),
	)

	// Blob upload init
	h.Handler(
		"POST",
		"/v2/:namespace/:repository/blobs/:digest",
		httpoci.handleOCIBlobUploadInit(reg),
	)

	// Blob upload status
	h.Handler(
		"GET",
		"/v2/:namespace/:repository/blobs/:digest/:uuid",
		httpoci.handleOCIBlobUploadStatus(reg),
	)

	// Blob upload chunk
	h.Handler(
		"PATCH",
		"/v2/:namespace/:repository/blobs/:digest/:uuid",
		httpoci.handleOCIBlobUploadChunk(reg),
	)

	// Blob upload complete
	h.Handler(
		"PUT",
		"/v2/:namespace/:repository/blobs/:digest/:uuid",
		httpoci.handleOCIBlobUploadComplete(reg),
	)

	// Blob upload cancel
	h.Handler(
		"DELETE",
		"/v2/:namespace/:repository/blobs/:digest/:uuid",
		httpoci.handleOCIBlobUploadCancel(reg),
	)
	return h
}
