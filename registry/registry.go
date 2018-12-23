package registry

import (
	"net/http"
)

var defaultAddr = "0.0.0.0:7548"

// Registry defines parameters for running a container image registry.
type Registry struct {
	server *http.Server
}

// Config is used to parameterize a registry.
type Config struct {
	addr string
}

// NewRegistry initializes a Registry with sane defaults.
func (c *Config) NewRegistry() (*Registry, error) {
	r := &Registry{
		server: &http.Server{
			Addr:    defaultAddr,
			Handler: router(),
		},
	}

	return r, nil
}
