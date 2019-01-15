local stori = import 'stori.libsonnet';

{
  'server-config.schema.json': stori.serverConfig(),

  // Builtin backends
  'storage/backend/inmem.schema.json': stori.storage.backend.inmem(),
}
