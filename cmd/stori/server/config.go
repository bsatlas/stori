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
	Server Server `json:"server"`
}

// Server defines server-specific parameters for the registry.
type Server struct {
	Address string `json:"address"`
	TLS     TLS    `json:"tls,omitempty"`
}

// TLS defines parameters for TLS connections to the registry.
type TLS struct {
	CertFile string `json:"certFile"`
	KeyFile  string `json:"keyFile"`
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
