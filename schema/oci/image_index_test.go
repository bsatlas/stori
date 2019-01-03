package oci

import (
	"fmt"
	"io/ioutil"
	"os"
	"testing"

	"github.com/xeipuuv/gojsonschema"
)

func TestImageIndexValidation(t *testing.T) {
	tt := []struct {
		name  string
		file  string
		valid bool
	}{
		{"golden", "golden.json", true},
		{"minimal", "golden-minimal.json", true},
		{"custom manifest mediatype", "custom-manifest-media-type.json", true},
		{"manifest not array", "manifest-not-array.json", false},
		{"platform combination invalid", "platform-combination-invalid.json", false},
		{"platform OS invalid", "platform-os-invalid.json", false},
		{"platform architecture invalid", "platform-arch-invalid.json", false},
		{"schema version missing", "schema-version-missing.json", false},
		{"schema version too high", "schema-version-too-high.json", false},
		{"schema version too low", "schema-version-too-low.json", false},
	}

	v := ImageIndexLoader
	for _, tc := range tt {
		tf := func(t *testing.T) {
			path := fmt.Sprintf("./test-fixtures/image-index/%v", tc.file)
			data, err := os.Open(path)
			if err != nil {
				t.Errorf("unable to open %v: %v", tc.file, err)
			}
			defer data.Close()

			b, err := ioutil.ReadAll(data)
			if err != nil {
				t.Errorf("unable to read data: %v", err)
			}

			loader := gojsonschema.NewBytesLoader(b)

			res, err := gojsonschema.Validate(v, loader)
			if err != nil {
				t.Errorf("unable to validate schema: %v", err)
			}

			if !res.Valid() && tc.valid {
				t.Fail()
			} else if res.Valid() && !tc.valid {
				t.Fail()
			}

		}

		t.Run(tc.name, tf)
	}
}
