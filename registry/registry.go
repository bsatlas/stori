package registry

import (
	"net/http"
)

var defaultAddr = "0.0.0.0:7548"

// Registry defines parameters for running a container image registry.
type Registry struct {
	server *http.Server
}

// NewRegistry initializes a Registry with sane defaults.
func NewRegistry() Registry {
	r := Registry{
		server: &http.Server{
			Addr:    defaultAddr,
			Handler: router(),
		},
	}

	return r
}
