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

package http

import (
	"net/http"

	"github.com/atlaskerr/stori/stori"

	"github.com/julienschmidt/httprouter"
	"github.com/prometheus/client_golang/prometheus/promhttp"
)

// Handler returns an http.Handler for the Stori API.
func Handler(props *stori.HandlerProperties) http.Handler {
	h := http.NewServeMux()

	// Metrics handler
	h.Handle("/metrics", metricsHandler())

	// OCI handler
	h.Handle("/v2", OCIHandler(props))

	return h
}

// metricsHandler returns an http.Handler for a Prometheus metrics endpoint.
func metricsHandler() http.Handler {
	h := httprouter.New()
	h.Handler("GET", "/metrics", promhttp.Handler())
	return h
}

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
	//h.Handler(
	//	"GET",
	//	"/v2/:namespace",
	//	handleOCICatalogList(reg),
	//)

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
