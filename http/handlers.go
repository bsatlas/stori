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

	httpoci "github.com/atlaskerr/stori/http/oci"
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
	h.Handle("/v2", httpoci.Handler(props))

	return h
}

// metricsHandler returns an http.Handler for a Prometheus metrics endpoint.
func metricsHandler() http.Handler {
	h := httprouter.New()
	h.Handler("GET", "/metrics", promhttp.Handler())
	return h
}
