package stori

import ()

var defaultAddr = "0.0.0.0:7548"

// Registry defines parameters for running a container image registry.
type Registry struct {
}

// Config is used to parameterize a registry.
type Config struct {
}

// New takes a Config and returns a fully initialized Registry.
func New(Config) (*Registry, error) {
	return &Registry{}, nil
}
