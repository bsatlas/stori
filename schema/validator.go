package schema

import (
	"fmt"
	"io"
	"io/ioutil"

	"github.com/xeipuuv/gojsonschema"
)

// Validator validates json against a jsonschema.
type Validator struct {
	Schema gojsonschema.JSONLoader
}

// Validate validates JSON against the `application/vnd.oci.image.index.v1+json`
// mediatype.
func (v *Validator) Validate(r io.Reader) error {
	data, err := ioutil.ReadAll(r)
	if err != nil {
		return fmt.Errorf("unable to read data: %v", err)
	}

	loader := gojsonschema.NewBytesLoader(data)
	res, err := gojsonschema.Validate(v.Schema, loader)
	if err != nil {
		return fmt.Errorf("unable to validate data: %v", err)
	}

	if !res.Valid() {
		return fmt.Errorf("schema validation failed")
	}

	return nil
}
