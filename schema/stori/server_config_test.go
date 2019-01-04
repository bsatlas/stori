package stori

import (
	"fmt"
	"io/ioutil"
	"os"
	"strings"
	"testing"

	"github.com/xeipuuv/gojsonschema"
)

type serverConfigTestParams struct {
	file  string
	valid bool
}

func TestServerConfigValidation(t *testing.T) {
	tt := []serverConfigTestParams{
		{"golden.json", true},
		{"tls-disabled.json", true},
		{"tls-enabled-no-cert-file.json", false},
		{"tls-enabled-no-key-file.json", false},
	}

	v := ServerConfigLoader
	for _, tc := range tt {
		tf := func(t *testing.T) {
			path := fmt.Sprintf("./test-fixtures/server-config/%v", tc.file)
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
				t.Errorf("expected valid schema, got invalid: %v", res.Errors())
			} else if res.Valid() && !tc.valid {
				t.Errorf("expected invalid schema, got valid")
			}
		}
		rmSuffix := strings.TrimSuffix(tc.file, ".json")
		name := strings.Replace(rmSuffix, "-", " ", -1)
		t.Run(name, tf)
	}
}
