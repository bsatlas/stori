package oci

import (
	"fmt"
	"os"
	"testing"
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
		{"schema version missing", "schema-version-missing.json", false},
		{"schema version too high", "schema-version-too-high.json", false},
		{"schema version too low", "schema-version-too-low.json", false},
	}

	v := ImageIndexValidator()
	for _, tc := range tt {
		tf := func(t *testing.T) {
			path := fmt.Sprintf("./test-fixtures/image-index/%v", tc.file)
			data, err := os.Open(path)
			if err != nil {
				t.Errorf("unable to open %v: %v", tc.file, err)
			}
			defer data.Close()

			err = v.Validate(data)
			if err != nil && tc.valid {
				t.Error("valid schema failed validation")
			}
		}

		t.Run(tc.name, tf)
	}
}
