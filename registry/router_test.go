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
