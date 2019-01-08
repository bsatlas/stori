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

package storage

import (
	"github.com/xeipuuv/gojsonschema"
)

// Backend is an interface for Stori's persistence layer.
type Backend interface {

	// GetSchema retrieves a gojsonschema.JSONLoader from the backend server to
	// validate the block in a config file referencing the backend.
	GetSchema() gojsonschema.JSONLoader

	// Setup passes an empty interface containing configuration data validated
	// by the JSONLoader recieved from `GetSchema()`
	Setup(interface{}) error
}
