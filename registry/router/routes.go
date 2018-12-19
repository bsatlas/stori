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

package router

import (
	"net/http"

	"github.com/julienschmidt/httprouter"
)

type route struct {
	method string
	path   string
	op     http.HandlerFunc
}

// Register adds all supported routes to an httprouter.Router.
func Register(r *httprouter.Router) {
	addRoutes(r, ociRoutes)
}

func addRoutes(r *httprouter.Router, routes []route) {
	for _, rt := range routes {
		r.HandlerFunc(rt.method, rt.path, rt.op)
	}
}
