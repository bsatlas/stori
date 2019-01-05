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

func TestOCIBlobGet(t *testing.T) {
	reg := stori.TestRegistry(t)

	ln, addr := TestServer(t, reg)
	defer ln.Close()

	endpoint := addr + "/v2/testns/testrepo/blobs/sha:f4c05499df06ef6fd8fefae0639a0364dae62de6477671ea84e15af63d92b132"
	req, err := http.NewRequest("GET", endpoint, nil)
	if err != nil {
		t.Fatalf("failed to init new request: %v", err)
	}

	client := http.Client{}
	resp, err := client.Do(req)
	if err != nil {
		t.Fatalf("request failed: %v", err)
	}

	expectedCode := http.StatusNotImplemented
	if resp.StatusCode != expectedCode {
		t.Errorf("endpoint %v: expected status code %v, got %v", endpoint, expectedCode, resp.Status)
	}

}

func TestOCIBlobExists(t *testing.T) {
	reg := stori.TestRegistry(t)

	ln, addr := TestServer(t, reg)
	defer ln.Close()

	endpoint := addr + "/v2/testns/testrepo/blobs/sha:f4c05499df06ef6fd8fefae0639a0364dae62de6477671ea84e15af63d92b132"
	req, err := http.NewRequest("HEAD", endpoint, nil)
	if err != nil {
		t.Fatalf("failed to init new request: %v", err)
	}

	client := http.Client{}
	resp, err := client.Do(req)
	if err != nil {
		t.Fatalf("request failed: %v", err)
	}

	expectedCode := http.StatusNotImplemented
	if resp.StatusCode != expectedCode {
		t.Errorf("endpoint %v: expected status code %v, got %v", endpoint, expectedCode, resp.Status)
	}

}

func TestOCIBlobDelete(t *testing.T) {
	reg := stori.TestRegistry(t)

	ln, addr := TestServer(t, reg)
	defer ln.Close()

	endpoint := addr + "/v2/testns/testrepo/blobs/sha:f4c05499df06ef6fd8fefae0639a0364dae62de6477671ea84e15af63d92b132"
	req, err := http.NewRequest("DELETE", endpoint, nil)
	if err != nil {
		t.Fatalf("failed to init new request: %v", err)
	}

	client := http.Client{}
	resp, err := client.Do(req)
	if err != nil {
		t.Fatalf("request failed: %v", err)
	}

	expectedCode := http.StatusNotImplemented
	if resp.StatusCode != expectedCode {
		t.Errorf("endpoint %v: expected status code %v, got %v", endpoint, expectedCode, resp.Status)
	}

}

func TestOCIBlobUploadInit(t *testing.T) {
	reg := stori.TestRegistry(t)

	ln, addr := TestServer(t, reg)
	defer ln.Close()

	endpoint := addr + "/v2/testns/testrepo/blobs/uploads"
	req, err := http.NewRequest("POST", endpoint, nil)
	if err != nil {
		t.Fatalf("failed to init new request: %v", err)
	}

	client := http.Client{}
	resp, err := client.Do(req)
	if err != nil {
		t.Fatalf("request failed: %v", err)
	}

	expectedCode := http.StatusNotImplemented
	if resp.StatusCode != expectedCode {
		t.Errorf("endpoint %v: expected status code %v, got %v", endpoint, expectedCode, resp.Status)
	}

}

func TestOCIBlobUploadStatus(t *testing.T) {
	reg := stori.TestRegistry(t)

	ln, addr := TestServer(t, reg)
	defer ln.Close()

	endpoint := addr + "/v2/testns/testrepo/blobs/uploads/sha:f4c05499df06ef6fd8fefae0639a0364dae62de6477671ea84e15af63d92b132"
	req, err := http.NewRequest("GET", endpoint, nil)
	if err != nil {
		t.Fatalf("failed to init new request: %v", err)
	}

	client := http.Client{}
	resp, err := client.Do(req)
	if err != nil {
		t.Fatalf("request failed: %v", err)
	}

	expectedCode := http.StatusNotImplemented
	if resp.StatusCode != expectedCode {
		t.Errorf("endpoint %v: expected status code %v, got %v", endpoint, expectedCode, resp.Status)
	}

}

func TestOCIBlobUploadChunk(t *testing.T) {
	reg := stori.TestRegistry(t)

	ln, addr := TestServer(t, reg)
	defer ln.Close()

	endpoint := addr + "/v2/testns/testrepo/blobs/uploads/sha:f4c05499df06ef6fd8fefae0639a0364dae62de6477671ea84e15af63d92b132"
	req, err := http.NewRequest("PATCH", endpoint, nil)
	if err != nil {
		t.Fatalf("failed to init new request: %v", err)
	}

	client := http.Client{}
	resp, err := client.Do(req)
	if err != nil {
		t.Fatalf("request failed: %v", err)
	}

	expectedCode := http.StatusNotImplemented
	if resp.StatusCode != expectedCode {
		t.Errorf("endpoint %v: expected status code %v, got %v", endpoint, expectedCode, resp.Status)
	}

}

func TestOCIBlobUploadComplete(t *testing.T) {
	reg := stori.TestRegistry(t)

	ln, addr := TestServer(t, reg)
	defer ln.Close()

	endpoint := addr + "/v2/testns/testrepo/blobs/uploads/sha:f4c05499df06ef6fd8fefae0639a0364dae62de6477671ea84e15af63d92b132"
	req, err := http.NewRequest("PUT", endpoint, nil)
	if err != nil {
		t.Fatalf("failed to init new request: %v", err)
	}

	client := http.Client{}
	resp, err := client.Do(req)
	if err != nil {
		t.Fatalf("request failed: %v", err)
	}

	expectedCode := http.StatusNotImplemented
	if resp.StatusCode != expectedCode {
		t.Errorf("endpoint %v: expected status code %v, got %v", endpoint, expectedCode, resp.Status)
	}

}

func TestOCIBlobUploadCancel(t *testing.T) {
	reg := stori.TestRegistry(t)

	ln, addr := TestServer(t, reg)
	defer ln.Close()

	endpoint := addr + "/v2/testns/testrepo/blobs/uploads/sha:f4c05499df06ef6fd8fefae0639a0364dae62de6477671ea84e15af63d92b132"
	req, err := http.NewRequest("DELETE", endpoint, nil)
	if err != nil {
		t.Fatalf("failed to init new request: %v", err)
	}

	client := http.Client{}
	resp, err := client.Do(req)
	if err != nil {
		t.Fatalf("request failed: %v", err)
	}

	expectedCode := http.StatusNotImplemented
	if resp.StatusCode != expectedCode {
		t.Errorf("endpoint %v: expected status code %v, got %v", endpoint, expectedCode, resp.Status)
	}

}
