local oapi = import 'openapi-jsonnet/v3.0.0/openapi.libsonnet';
local header = oapi.header.new;
local schemas = import 'schemas/schemas.libsonnet';
local string = schemas.common.string;

local common = {
  local wwwAuth =
    header(
      name='WWW-Authenticate',
      schema=string,
      description='Defines the authentication method that should be used to gain access to a resource.',
    ),

  local contentLength =
    header(
      name='Content-Length',
      schema=string,
      description='The byte length of the data returned .',
    ),

  local contentType =
    header(
      name='Content-Type',
      schema=string,
      description='The MIME type of the data.',
    ),

  local contentTypeOptions =
    header(
      name='X-Content-Type-Options',
      schema=string,
      description='Content type options.',
    ),

  local contentRange =
    header(
      name='Content-Range',
      schema=string,
      description='The byte range of the data returned.',
    ),

  local date =
    header(
      name='Date',
      schema=string,
      description='The date and time the message was originated.',
    ),

  local location =
    header(
      name='Location',
      description='Indicates the URL to redirect to.',
      schema=string,
    ),

  local range =
    header(
      name='Range',
      description='A byte range used to coordinate chunked uploads to the server.',
      schema=string,
    ),

  wwwAuth:: wwwAuth,
  contentLength:: contentLength,
  contentType:: contentType,
  contentTypeOptions:: contentTypeOptions,
  contentRange:: contentRange,
  date:: date,
  location: location,
  range:: range,
};

local docker = {

  local version =
    header(
      name='Docker-Distribution-API-Version',
      schema=string,
      description='Used by clients to determine if the registry implements the distribution specification.',
    ),

  local contentDigest =
    header(
      name='Docker-Content-Digest',
      description='Includes the digest of the target entity returned in the response. Clients can use this header to verify the integrity of downloaded content',
      schema=string,
    ),

  local uploadUUID =
    header(
      name='Docker-Upload-UUID',
      description='A unique identifier used to correlate local state with remote state. Clients use this to implement resumable uploads.',
      schema=string,
    ),


  version: version,
  contentDigest: contentDigest,
  uploadUUID: uploadUUID,
};

{
  common:: common,
  docker:: docker,
}

//{
//  wwwAuth:: {
//    'WWW-Authenticate': {
//      description: 'Defines the authentication method that should be used to gain access to a resource.',
//      schema: string,
//    },
//  },
//
//  dockerApiVersion:: {
//    'Docker-Distribution-API-Version': {
//      description: 'Used by clients to determine if the registry implements the distribution specification.',
//      schema: string,
//    },
//  },
//
//  dockerContentDigest:: {
//    'Docker-Content-Digest': {
//      description: 'Includes the digest of the target entity returned in the response. Clients can use this header to verify the integrity of downloaded content',
//      schema: string,
//    },
//  },
//
//  dockerUploadUUID:: {
//    'Docker-Upload-UUID': {
//      description: 'A unique identifier used to correlate local state with remote state. Clients use this to implement resumable uploads.',
//      schema: string,
//    },
//  },
//
//  contentLength:: {
//    'Content-Length': {
//      description: 'The byte length of the data returned .',
//      schema: string,
//    },
//  },
//
//  contentType:: {
//    'Content-Type': {
//      description: 'The MIME type of the data.',
//      schema: string,
//    },
//  },
//
//  contentTypeOptions:: {
//    'X-Content-Type-Options': {
//      description: 'Content type options.',
//      schema: string,
//    },
//  },
//
//  contentRange:: {
//    'Content-Range': {
//      description: 'The byte range of the data returned.',
//      schema: string,
//    },
//  },
//
//  date:: {
//    Date: {
//      description: 'The date and time the message was originated.',
//      schema: string,
//    },
//  },
//
//}



