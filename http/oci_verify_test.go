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

package http

import (
	"net/http"
	"testing"

	"github.com/atlaskerr/stori/stori"
)

func TestVerifyHandler(t *testing.T) {
	reg := stori.TestRegistry(t)

	ln, addr := TestServer(t, reg)
	defer ln.Close()

	endpoint := addr + "/v2"
	resp, err := http.Get(endpoint)
	if err != nil {
		t.Fatalf("request failed: %v", err)
	}

	expectedCode := http.StatusOK
	if resp.StatusCode != expectedCode {
		t.Errorf("expected status code %v, got %v", expectedCode, resp.Status)
	}

	dockerHeader := DockerDistributionHeaderName
	value, ok := resp.Header[dockerHeader]
	if !ok {
		t.Errorf("required header '%v' not found", dockerHeader)
	}

	dockerValue := DockerDistributionHeaderValue
	if value[0] != dockerValue {
		t.Errorf("invalid header value for '%v': expected '%v', got '%v'", dockerHeader, dockerValue, value[0])
	}

}
