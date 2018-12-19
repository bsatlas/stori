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

package registry

import (
	"log"
	"net/http"

	"github.com/atlaskerr/stori/registry/router"

	"github.com/julienschmidt/httprouter"
)

// The Registry struct contains information necessary for a registry to run.
type Registry struct {
	router *httprouter.Router
	bindIP string
	port   string
}

// NewRegistry initializes a Registry.
func NewRegistry() (r *Registry) {
	r = &Registry{
		router: httprouter.New(),
		bindIP: "0.0.0.0",
		port:   "8080",
	}
	return
}

// Start the registry.
func (r *Registry) Start() {
	r.start()
}

func (r *Registry) start() {
	router.Register(r.router)

	log.Fatal(http.ListenAndServe(r.bindIP+":"+r.port, r.router))
}
