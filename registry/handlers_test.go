package registry

import (
	"net/http"
	"net/http/httptest"
	"testing"
)

func TestNotImplementedHandler(t *testing.T) {
	w := httptest.NewRecorder()
	r := httptest.NewRequest("GET", "/v2", nil)
	NotImplemented(w, r)

	if w.Code != http.StatusNotImplemented {
		t.Error("Incorrect status code")
	}
}
