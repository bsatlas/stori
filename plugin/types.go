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

package plugin

import "fmt"

// Type represents a plugin type.
type Type uint32

// Types is a wrapper around plugin type constants for discovery purposes.
var Types = []Type{
	TypeBackend,
}

// A list of plugin types supported by stori.
const (
	TypeUnknown Type = iota
	TypeBackend
)

func (t Type) String() string {
	switch t {
	case TypeUnknown:
		return "unknown"
	case TypeBackend:
		return "backend"
	default:
		return "unsupported"
	}
}

// ParseType takes a string representation of a plugin type and returns
// a concrete type.
func ParseType(pluginType string) (Type, error) {
	switch pluginType {
	case "unknown":
		return TypeUnknown, nil
	case "backend":
		return TypeBackend, nil
	default:
		return TypeUnknown, fmt.Errorf("%q is not a supported plugin type", pluginType)

	}
}
