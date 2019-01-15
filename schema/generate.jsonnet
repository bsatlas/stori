local stori = import 'stori.libsonnet';

{
  'server-config.schema.json': stori.serverConfig(),
  'namespace-create.schema.json': stori.namespaceCreate(),

  // Builtin backends
  'storage/backend/inmem.schema.json': stori.storage.backend.inmem(),
}
