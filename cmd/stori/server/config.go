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

package server

import (
	"encoding/json"
	"io/ioutil"
)

// Config defines the parameters for the registry.
type Config struct {
	Server   Server   `json:"server"`
	Registry Registry `json:"registry"`
}

// Server defines server-specific parameters for the registry.
type Server struct {
	Address string `json:"address"`
	TLS     TLS    `json:"tls,omitempty"`
}

// TLS defines parameters for TLS connections to the registry.
type TLS struct {
	Enabled  bool   `json:"enabled"`
	CertFile string `json:"certFile"`
	KeyFile  string `json:"keyFile"`
}

// Registry defines registry-specific parameters.
type Registry struct {
	Backend   `json:"backend"`
	BlobStore `json:"blobStore"`
}

// Backend defines parameters for stori's persistence layer.
type Backend struct {
	// Name is the name of the backend. If stori does not support the defined
	// backend, it will look in its PATH for a binary plugin named
	// `stori-{name}-backend`.
	Name string `json:"name"`

	// Config contains the backend's config parameters. Since different backends
	// require different configuration parameters, we can't parse the object yet
	// since we don't know the schema.
	Config map[string]interface{} `json:"config"`
}

// BlobStore defines parameters for stori's blob storage engine.
type BlobStore struct {
	// Name is the name of the backend. If stori does not support the defined
	// backend, it will look in its PATH for a binary plugin named
	// `stori-{name}-blobstore`.
	Name string `json:"name"`

	// Config contains the blobstore's config parameters. Since different
	// blobstores require different configuration parameters, we can't parse the
	// object yet since we don't know the schema.
	Config map[string]interface{} `json:"config"`
}

// DevConfig provides a dev config.
var DevConfig = &Config{
	Server: Server{
		Address: "127.0.0.1:8385",
	},
}

// LoadConfigFile loads the configuration from the given file.
func LoadConfigFile(path string) (*Config, error) {
	data, err := ioutil.ReadFile(path)
	if err != nil {
		return nil, err
	}
	return parseConfig(data)
}

// ParseConfig parses a json byte slice into a Config struct.
func parseConfig(data []byte) (*Config, error) {
	var conf Config
	if err := json.Unmarshal(data, &conf); err != nil {
		return nil, err
	}
	return &conf, nil
}
