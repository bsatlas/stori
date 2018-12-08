local date = { type: 'string', format: 'date-time' };

local string = { type: 'string' };

local bool = { type: 'boolean' };

local int64 = {
  type: 'integer',
  minimum: -9223372036854776000,
  maximum: 9223372036854776000,
};

local mapStringObject = {
  type: 'object',
  patternProperties: {
    '.{1,}': { type: 'object' },
  },
};

local mapStringString = {
  type: 'object',
  patternProperties: {
    '.{1,}': { type: 'string' },
  },
};

local arrayOfStrings = {
  type: 'array',
  items: { type: 'string' },
};

// application/vnd.oci.image.config.v1+json
local config = {


  // The image config media type contains an object called config that
  // contains information about the runtime configuration of an image.
  local innerConfig = {

    local user = string {
      description: 'The username or UID which is a platform-specific structure that allows specific control over which user the process run as. This acts as a default value to use when the value is not specified when creating a container. For Linux based systems, all of the following are valid: `user`, `uid`, `user:group`, `uid:gid`, `uid:group`, `user:gid`. If `group`/`gid` is not specified, the default group and supplementary groups of the given `user`/`uid` in `/etc/passwd` from the container are applied.',
    },

    local exposedPorts = mapStringObject {
      description: 'A set of ports to expose from a container running this image. Its keys can be in the format of `port/tcp`, `port/udp`, or `port` with the default protocol being `tcp` if not specified. These values act as defaults and are merged with any specified when creating a container.',
    },

    local env = arrayOfStrings {
      description: 'Entries are in the format of `VARNAME=VARVALUE`. These values act as defaults and are merged with any specified when creating a container.',
    },

    local entryPoint = arrayOfStrings {
      description: 'A list of arguments to use as the command to execute when the container starts. These values act as defaults and may be replaced by an entrypoint specified when creating a container.',
    },

    local cmd = arrayOfStrings {
      description: 'Default arguments to the entrypoint of the container. These values act as defaults and may be replaced by any specified when creating a container. If an `Entrypoint` value is not specified, then the first entry of the `Cmd` array SHOULD be interpreted as the executable to run.',
    },

    local volumes = mapStringObject {
      description: 'A set of directories describing where the process is likely to write data specific to a container instance.',
    },

    local workingDir = string {
      description: 'Sets the current working directory of the entrypoint process in the container. This value acts as a default and may be replaced by a working directory specified when creating a container.',
    },

    local labels = mapStringString {
      description: 'The field contains arbitrary metadata for the container. This property MUST use the annotation rules.',
    },

    local stopSignal = string {
      description: 'The field contains the system call that will be sent to the container to exit. The signal can be a signal name in the format `SIGNAME`, for instance `SIGKILL` or `SIGRTMIN+3`',
    },

    type: 'object',
    properties: {
      User: user,
      ExposedPorts: exposedPorts,
      Env: env,
      Entrypoint: entryPoint,
      Cmd: cmd,
      Volumes: volumes,
      WorkingDir: workingDir,
      Labels: labels,
      StopSignal: stopSignal,
    },
  },

  local rootfs = {

    local type = string {
      description: 'MUST be set to `layers`. Implementations MUST generate an error if they encounter an unknown value while verifying or unpacking an image.',
      enum: ['layers'],
    },

    local diff_ids = arrayOfStrings {
      description: 'An array of layer content hashes in order from first to last.',
    },

    type: 'object',
    properties: {
      type: type,
      diff_ids: diff_ids,
    },
    required: [
      'diff_ids',
      'type',
    ],
  },

  local history = {
    type: 'array',
    items: {
      type: 'object',
      properties: {

        created: string {
          description: 'A combined date and time at which the layer was created, formatted asdefined by RFC 3339, section 5.6.',
        },

        author: string {
          description: 'The author of the build point.',
        },

        created_by: string {
          description: 'The command which created the layer.',
        },

        comment: string {
          description: 'A custom message set when creating the layer.',
        },

        empty_layer: bool {
          description: "This field is used to mark if the history item created a filesystem diff. It is set to true if the history item doesn't correspond to an actual layer in the rootfs section.",
        },
      },
    },
  },

  description: 'OCI Config Specification',
  '$schema': 'http://json-schema.org/draft-04/schema#',
  type: 'object',
  properties: {
    created:
      date {
        description: 'A combined date and time at which the image was created, formatted as defined by RFC 3339, section 5.6.',
      },

    author:
      string {
        description: 'Gives the name and/or email address of the person or entity which created and is responsible for maintaining the image.',
      },

    architecture:
      string {
        description: 'The CPU architecture which the binaries in the image are built to run on. Configurations SHOULD use, and implementations SHOULD understand, values listed in the Go Language documentation for `GOARCH`.',
      },

    os:
      string {
        description: 'The name of the operating system which the image is built to run on. Configurations SHOULD use, and implementations SHOULD understand, values listed in the Go Language document for `GOOS`.',
      },

    config:
      innerConfig {
        description: 'The execution parameters which SHOULD be used as a base when running a container using the image. This field can be null, in which case any execution parameters should be specified at creation of the container.',
      },

    rootfs:
      rootfs {
        description: 'The rootfs key references the layer content addresses used by the image. This makes the image config hash depend on the filesystem hash.',
      },

    history:
      history {
        description: 'Describes the history of each layer. In order from first to last.',
      },
  },
  required: [
    'architecture',
    'os',
    'rootfs',
  ],
};

local mediaType = {
  description: '',
  type: 'string',
  pattern: '^[A-Za-z0-9][A-Za-z0-9!#$&-^_.+]{0,126}/[A-Za-z0-9][A-Za-z0-9!#$&-^_.+]{0,126}$',
};

local annotations =
  mapStringString {
    description: 'This OPTIONAL property contains arbitrary metadata for the descriptor and MUST use the annotation rules.',
  };

local contentDescriptor = {

  local size =
    int64 {
      description: 'This REQUIRED property specifies the size, in bytes, of the raw content. This property exists so that a client will have an expected size for the content before processing. If the length of the retrieved content does not match the specified length, the content SHOULD NOT be trusted.',
    },

  local digest = {
    description: 'the cryptographic checksum digest of the object, in the pattern `<algorithm>:<encoded>`',
    type: 'string',
    pattern: '^[a-z0-9]+(?:[+._-][a-z0-9]+)*:[a-zA-Z0-9=_-]+$',
  },

  local urls = {
    description: 'A list of URLs from which the content may be downloaded.',
    type: 'array',
    items: {
      type: 'string',
      format: 'uri',
    },
  },

  description: 'A descriptor for referencing a blob.',
  type: 'object',
  properties: {
    mediaType: mediaType,
    size: size,
    digest: digest,
    urls: urls,
    annotations: annotations,
  },
  required: [
    'size',
    'mediaType',
    'digest',
  ],
};

local schemaVersion = {
  description: 'This REQUIRED property specifies the schema version. For this version ofthe specification, this MUST be `2` to ensure backward compatibility with older versions of Docker. The value of this field will not change.',
  type: 'integer',
  minimum: 2,
  maximum: 2,
};

// application/vnd.oci.image.manifest.v1+json
local imageManifest = {


  local layers = {
    description: 'Each item in the array MUST be a descriptor. The array MUST have the base layer at index 0. Subsequent layers MUST then follow in stack order (i.e. from layers[0] to layers[len(layers)-1]). The final filesystem layout MUST match the result of applying the layers to an empty directory. The ownership, mode, and other attributes of the initial empty directory are unspecified.',
    type: 'array',
    items: contentDescriptor,
  },

  local annotations =
    mapStringString {
      description: 'This OPTIONAL property contains arbitrary metadata for the image manifest and MUST use the annotation rules.',
    },

  description: 'OCI Image Manifest Specification',
  '$schema': 'http://json-schema.org/draft-04/schema#',
  type: 'object',
  properties: {
    schemaVersion: schemaVersion,
    config: contentDescriptor,
    layers: layers,
    annotations: annotations,
  },
  required: [
    'schemaVersion',
    'config',
    'layers',
  ],
};

local imageIndex = {

  local platform = {
    type: 'object',
    properties: {
      architecture: string {
        description: 'This REQUIRED property specifies the CPU architecture. Image indexes SHOULD use, and implementations SHOULD understand, values listed in the Go Language document for `GOARCH`',
      },
      os: string {
        description: 'This REQUIRED property specifies the operating system. Image indexes SHOULD use, and implementations SHOULD understand, values listed in the Go Language document for `GOOS`.',
      },
      'os.version': string {
        description: 'This OPTIONAL property specifies the version of the operating system targeted by th referenced blob. Implementations MAY refuse to use manifests where os.version is not known to work with the host OS version. Valid values are implementation-defined. eg. `10.0.14393.1066` on windows.',
      },
      'os.features': arrayOfStrings {
        description: 'This OPTIONAL property specifies an array of strings, each specifying a mandatory OS feature.',
      },
      variant: string {
        description: 'This OPTIONAL property specifies the variant of the CPU.',
      },
      features: arrayOfStrings {
        description: 'This property is RESERVED for future versions of the specification.',
      },
    },
    required: [
      'architecture',
      'os',
    ],
  },

  local manifests = {
    description: 'This REQUIRED property contains a list of manifests for specific platforms. While this property MUST be present, the size of the array MAY be zero',
    type: 'array',
    items: contentDescriptor {},
  },

  description: 'OCI Image Index Specification',
  '$schema': 'http://json-schema.org/draft-04/schema#',
  type: 'object',
  properties: {
    schemaVersion: schemaVersion,
    mediaType: mediaType,
    manifests: manifests {
      items+: {
        properties+: {
          platform: platform,
        },
      },
    },
    annotations: annotations,
  },
  required: [
    'schemaVersion',
    'manifests',
  ],
};

local errors = {
  type: 'object',
  properties: {
    errors: {
      type: 'array',
      items: {
        type: 'object',
        properties: {
          code: string,
          message: string,
          detail: string,
        },
      },
    },
  },
};


{
  'oci-config-schema.json': config,
  'oci-image-manifest-schema.json': imageManifest,
  'oci-image-index-schema.json': imageIndex,
  'oci-error-schema.json': errors,
}
