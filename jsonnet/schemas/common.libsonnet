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

local string = { type: 'string' };

{
  jsonSchemaV4: 'http://json-schema.org/draft-04/schema#',

  string: string,

  binary: string { format: 'binary' },

  date: string { format: 'date-time' },

  bool: { type: 'boolean' },

  int64: {
    type: 'integer',
    minimum: -9223372036854776000,
    maximum: 9223372036854776000,
  },

  mapStringObject(output):: {
    type: 'object',
    [if output == 'jsonschema' then 'patternProperties' else 'x-patternProperties']: {
      '.{1,}': {
        type: 'object',
      },
    },
  },

  mapStringString(output):: {
    type: 'object',
    [if output == 'jsonschema' then 'patternProperties' else 'x-patternProperties']: {
      '.{1,}': {
        type: 'string',
      },
    },
  },

  arrayOfStrings: {
    type: 'array',
    items: string,
  },

}
