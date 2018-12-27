package stori

import (
	"go.uber.org/zap"
)

var defaultAddr = "0.0.0.0:7548"

// Registry defines parameters for running a container image registry.
type Registry struct {
	logger zap.Logger
}

// RegistryConfig is used to parameterize a registry.
type RegistryConfig struct {
	Logger zap.Logger
}

// NewRegistry takes a RegistryConfig and returns a fully initialized Registry.
func NewRegistry(reg *RegistryConfig) (*Registry, error) {
	return &Registry{
		logger: reg.Logger,
	}, nil
}
