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
}

var ociVerify = newRoute(
	"GET",
	"/v2",
	notImplemented,
)

var ociCatalogList = newRoute(
	"GET",
	"/v2/_catalog",
	notImplemented,
)

var ociTagsList = newRoute(
	"GET",
	"/v2/tags/list",
	notImplemented,
)
