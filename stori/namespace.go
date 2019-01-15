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

// Namespace defines methods backends must implement for working with registry
// namespaces.
type Namespace interface {

	// CreateNamespace creates a new namespace in the registry.
	CreateNamespace(conf NamespaceConfig) (*NamespaceInfo, error)

	// LookupNamespaceByName performs a lookup on the registry for a namespace
	// with a name matching the string provided.
	LookupNamespaceByName(string) (*NamespaceInfo, error)

	// LookupNamespaceByID performs a lookup on the registry for a namespace
	// with an ID matching the string provided.
	LookupNamespaceByID(string) (*NamespaceInfo, error)
}

// NamespaceConfig defines the parameters available for creating a namespace.
type NamespaceConfig struct {

	// Name is the name of the namespace. Must be unique across all namespaces
	// hosted on the registry.
	Name string

	// BlobStorageLimit is the maximum size (in bytes) that the cumulative size
	// of blobs within a namespace can grow to. Mounted blobs are not counted
	// towards the limit.
	BlobStorageLimit uint64

	// RepositoryLimit is the maximum allowable amount of repositories that can
	// be contained within a namespace.
	RepositoryLimit uint64

	// Labels defines optional client-supplied metadata for a namespace.
	Labels map[string]string
}

// NamespacePhase represents the status of a namespace.
type NamespacePhase string

const (
	// NamespaceActive when set, notifies clients that the namespace is able to
	// have content allocated to it.
	NamespaceActive NamespacePhase = "Active"

	// NamespaceTerminating when set, notifies clients that the namespace is not
	// available to have conent allocated to it.
	NamespaceTerminating NamespacePhase = "Terminating"
)

// NamespaceInfo defines operations for stori namespaces. A namespace is
// a logical grouping of repositories and a fundamental building block for
// policy enforcement.
type NamespaceInfo struct {

	// Name is a name that uniquely identifies a namespace among all namespaces.
	Name string

	// Status defines what phase the namespace is in.
	Status NamespacePhase
}
