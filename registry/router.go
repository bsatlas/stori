package registry

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
