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
	{
		method: "GET",
		path:   "/v2",
		op:     notImplemented,
	},
}
