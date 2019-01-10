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

// Repository defines the data structures associated with repositories.
type Repository struct {

	// Name is a name that uniquely identifies a repository within a single
	// namespace.
	Name string

	// ID is a unique value for a particular repository that will change if the
	// repository is removed from the system and another registry is added with
	// the same name. RIDs are unique accross the entire registry.
	ID int32
}
