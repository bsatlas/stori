package registry

import (
	"net/http"
	"net/http/httptest"
	//	"net/http/httputil"
	"net/url"
	"testing"
)

func TestOCIRoutes(t *testing.T) {
	tt := []struct {
		name   string
		method string
		path   string
		code   int
		err    string
	}{
		{
			name:   "oci-verify",
			method: "GET",
			path:   "/v2",
			code:   http.StatusNotImplemented,
			err:    "",
		},
		{
			name:   "oci-catalog-list",
			method: "GET",
			path:   "/v2/_catalog",
			code:   http.StatusNotImplemented,
			err:    "",
		},
		{
			name:   "oci-tags-list",
			method: "GET",
			path:   "/v2/testns/testrepo/tags/list",
			code:   http.StatusNotImplemented,
			err:    "",
		},
		{
			name:   "oci-manifest-get",
			method: "GET",
			path:   "/v2/testns/testrepo/manifests/sha:5891b5b522d5df086d0ff0b110fbd9d21bb4fc7163af34d08286a2e846f6be03",
			code:   http.StatusNotImplemented,
			err:    "",
		},
		{
			name:   "oci-manifest-exists",
			method: "HEAD",
			path:   "/v2/testns/testrepo/manifests/sha:5891b5b522d5df086d0ff0b110fbd9d21bb4fc7163af34d08286a2e846f6be03",
			code:   http.StatusNotImplemented,
			err:    "",
		},
		{
			name:   "oci-manifest-create",
			method: "PUT",
			path:   "/v2/testns/testrepo/manifests/sha:5891b5b522d5df086d0ff0b110fbd9d21bb4fc7163af34d08286a2e846f6be03",
			code:   http.StatusNotImplemented,
			err:    "",
		},
		{
			name:   "oci-manifest-delete",
			method: "DELETE",
			path:   "/v2/testns/testrepo/manifests/sha:5891b5b522d5df086d0ff0b110fbd9d21bb4fc7163af34d08286a2e846f6be03",
			code:   http.StatusNotImplemented,
			err:    "",
		},
		{
			name:   "oci-blob-download",
			method: "GET",
			path:   "/v2/testns/testrepo/blobs/sha:5891b5b522d5df086d0ff0b110fbd9d21bb4fc7163af34d08286a2e846f6be03",
			code:   http.StatusNotImplemented,
			err:    "",
		},
		{
			name:   "oci-blob-exists",
			method: "GET",
			path:   "/v2/testns/testrepo/blobs/sha:5891b5b522d5df086d0ff0b110fbd9d21bb4fc7163af34d08286a2e846f6be03",
			code:   http.StatusNotImplemented,
			err:    "",
		},
	}

	for _, tc := range tt {
		t.Run(tc.name, func(t *testing.T) {
			registry := NewRegistry()
			srv := httptest.NewServer(registry.server.Handler)
			defer srv.Close()
			addr, err := url.Parse(srv.URL + tc.path)

			r := &http.Request{
				Method: tc.method,
				URL:    addr,
			}

			res, err := http.DefaultClient.Do(r)
			if err != nil {
				t.Errorf("Cannot connect to server")
			}

			if res.StatusCode != tc.code {
				t.Errorf("Expected status %v; got %v", tc.code, res.StatusCode)
			}
		})
	}
}
