package inmem

import (
	"encoding/json"
	"testing"
)

func TestNewBackend(t *testing.T) {
	b, err := New()
	if err != nil {
		t.Fatal("could not initialize new backend")
	}

	if b.schema == nil {
		t.Fatal("new backend doesn't contain a jsonschema")
	}

	if !json.Valid(b.schema) {
		t.Fatal("jsonschema not valid json")
	}

	if b.db == nil {
		t.Fatal("new backend doesn't have a database")
	}
}

func TestGetSchema(t *testing.T) {
	b, _ := New()
	schema := b.GetSchema()
	if schema == nil {
		t.Fatal("no jsonschema returned")
	}
}
