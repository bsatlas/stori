package inmem

import (
	"encoding/json"
	"testing"

	"github.com/atlaskerr/stori/stori"
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

func TestSetup(t *testing.T) {
	b, _ := New()
	var param interface{}
	err := b.Setup(param)
	if err != nil {
		t.Fatal("non-nil value returned")
	}
}

func TestCreateNamepace(t *testing.T) {
	tt := []struct {
		name   string
		nsConf stori.NamespaceConfig
	}{
		{"ns1", stori.NamespaceConfig{
			Name:             "ns1",
			BlobStorageLimit: 346542,
			RepositoryLimit:  10,
			Labels: map[string]string{
				"foo": "bar",
				"boo": "far",
				"baz": "fuz",
				"faz": "buz",
			},
		}},
	}

	for _, tc := range tt {
		tf := func(t *testing.T) {
			backend, err := New()
			if err != nil {
				t.Fatal("could not initialize backend")
			}
			var i interface{}
			if err := backend.Setup(i); err != nil {
				t.Fatal("failed to setup backend")
			}
			backend.CreateNamespace(tc.nsConf)

		}
		t.Run(tc.name, tf)
	}
}
