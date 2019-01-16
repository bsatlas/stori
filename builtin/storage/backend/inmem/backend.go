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

package inmem

import (
	"encoding/json"
	"strings"

	"github.com/atlaskerr/stori/schema/storage/backend"
	"github.com/atlaskerr/stori/stori"

	"github.com/tidwall/buntdb"
)

// Backend implements stori.Backend.
type Backend struct {
	schema []byte
	db     *buntdb.DB
}

// New returns an new in-memory backend.
func New() (*Backend, error) {
	b := new(Backend)

	// Load jsonschema
	source := backend.InmemConfigLoaderFunc()
	rawJSON, err := json.Marshal(source.JsonSource())
	if err != nil {
		return nil, err
	}

	b.schema = rawJSON

	// initialize the database
	memDB, err := buntdb.Open(":memory:")
	if err != nil {
		return nil, err
	}
	b.db = memDB

	return b, nil
}

// GetSchema retrieves a valid jsonschema in bytes from the backend. Used to
// validate the config files.
func (b *Backend) GetSchema() []byte {
	return b.schema
}

func (b *Backend) setupIndexes() {
	b.db.CreateIndex("namespaces", "namespace:*")
}

// Setup passes validated configuration data to the backend for
// initialization.
func (b *Backend) Setup(interface{}) error {
	b.setupIndexes()
	return nil
}

func set(tx *buntdb.Tx, key, value string) {
	tx.Set(key, value, nil)
}

// CreateNamespace creates a new namespace in the registry.
func (b *Backend) CreateNamespace(
	conf stori.NamespaceConfig) error {

	keySlice := []string{"namespace", conf.Name}

	var fields map[string]string
	fields["blob-storage-limit"] = string(conf.BlobStorageLimit)
	fields["repository-limit"] = string(conf.RepositoryLimit)
	fields["status"] = string(stori.NamespaceActive)

	for k, v := range conf.Labels {
		keySlice := []string{"label", k}
		labelKey := strings.Join(keySlice, ":")
		fields[labelKey] = v
	}

	updateFunc := func(tx *buntdb.Tx) error {
		for k, v := range fields {
			s := make([]string, len(keySlice))
			copy(s, keySlice)
			s = append(s, k)
			absoluteKey := strings.Join(s, ":")
			set(tx, absoluteKey, v)
		}
		return nil
	}

	b.db.Update(updateFunc)

	return nil
}
