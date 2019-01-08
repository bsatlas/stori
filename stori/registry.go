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

package stori

import (
	"github.com/atlaskerr/stori/storage"
	"go.uber.org/zap"
)

// Registry defines parameters for running a container image registry.
type Registry struct {
	backend   *storage.Backend
	blobstore *storage.BlobStore
	logger    *zap.Logger
}

// RegistryConfig is used to parameterize a registry.
type RegistryConfig struct {
	Logger *zap.Logger
}

// NewRegistry takes a RegistryConfig and returns a fully initialized Registry.
func NewRegistry(reg *RegistryConfig) (*Registry, error) {
	return &Registry{
		logger: reg.Logger,
	}, nil
}
