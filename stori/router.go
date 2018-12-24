package stori

import (
	"net/http"

	"github.com/julienschmidt/httprouter"
)

type route struct {
	method string
	path   string
	op     http.HandlerFunc
}

func newRoute(m, p string, op http.HandlerFunc) route {
	rt := route{
		method: m,
		path:   p,
		op:     op,
	}
	return rt
}

func addRoutes(r *httprouter.Router, routes []route) {
	for _, rt := range routes {
		r.HandlerFunc(rt.method, rt.path, rt.op)
	}
}

func router() *httprouter.Router {
	r := httprouter.New()
	addRoutes(r, ociRoutes)
	return r
}

var ociRoutes = []route{
	ociVerify,
	ociCatalogList,
	ociTagsList,
	ociManifestGet,
	ociManifestExists,
	ociManifestCreate,
	ociManifestDelete,
	ociBlobDownload,
	ociBlobExists,
	ociBlobDelete,
	ociBlobUploadInit,
	ociBlobUploadStatus,
	ociBlobUploadChunk,
	ociBlobUploadComplete,
	ociBlobUploadCancel,
}

var ociVerify = newRoute(
	"GET",
	"/v2",
	notImplemented,
)

// Handler should manually check if namespace parameter is set to `_catalog`.
var ociCatalogList = newRoute(
	"GET",
	"/v2/:namespace",
	notImplemented,
)

var ociTagsList = newRoute(
	"GET",
	"/v2/:namespace/:repository/tags/list",
	notImplemented,
)

var ociManifestGet = newRoute(
	"GET",
	"/v2/:namespace/:repository/manifests/:reference",
	notImplemented,
)

var ociManifestExists = newRoute(
	"HEAD",
	"/v2/:namespace/:repository/manifests/:reference",
	notImplemented,
)

var ociManifestCreate = newRoute(
	"PUT",
	"/v2/:namespace/:repository/manifests/:reference",
	notImplemented,
)

var ociManifestDelete = newRoute(
	"DELETE",
	"/v2/:namespace/:repository/manifests/:reference",
	notImplemented,
)

var ociBlobDownload = newRoute(
	"GET",
	"/v2/:namespace/:repository/blobs/:digest",
	notImplemented,
)

var ociBlobExists = newRoute(
	"HEAD",
	"/v2/:namespace/:repository/blobs/:digest",
	notImplemented,
)

var ociBlobDelete = newRoute(
	"DELETE",
	"/v2/:namespace/:repository/blobs/:digest",
	notImplemented,
)

// Handler should manually check if digest parameter is set to `uploads`.
var ociBlobUploadInit = newRoute(
	"POST",
	"/v2/:namespace/:repository/blobs/:digest",
	notImplemented,
)

// Handler should manually check if digest parameter is set to `uploads`.
var ociBlobUploadStatus = newRoute(
	"GET",
	"/v2/:namespace/:repository/blobs/:digest/:uuid",
	notImplemented,
)

// Handler should manually check if digest parameter is set to `uploads`.
var ociBlobUploadChunk = newRoute(
	"PATCH",
	"/v2/:namespace/:repository/blobs/:digest/:uuid",
	notImplemented,
)

var ociBlobUploadComplete = newRoute(
	"PUT",
	"/v2/:namespace/:repository/blobs/:digest/:uuid",
	notImplemented,
)

var ociBlobUploadCancel = newRoute(
	"DELETE",
	"/v2/:namespace/:repository/blobs/:digest/:uuid",
	notImplemented,
)