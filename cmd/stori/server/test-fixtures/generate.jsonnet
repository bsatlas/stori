local goldenConfig = {
  address: '0.0.0.0:4334',
  tls: {
    enabled: false,
    certFile: './server.pem',
    keyFile: './server-key.pem',
  },
  storage: {
    backend: {
      name: 'inmem',
      hash: '3b9b30f12cb1209f13e5c0ddfae8e24c9116002fa703e0d813d1fb38d7098450',
      config: {},
    },
  },
};

{
  'config-golden.json': goldenConfig,
}
