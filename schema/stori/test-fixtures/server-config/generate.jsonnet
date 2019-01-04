local golden = {
  address: '0.0.0.0:1234',
  tls: {
    enabled: true,
    certFile: '/etc/ssl/stori/cert.pem',
    keyFile: '/etc/ssl/stori/key.pem',
  },
};

local tlsEnabledNoCertFile = {
  address: '0.0.0.0:1234',
  tls: {
    enabled: true,
    keyFile: '/etc/ssl/stori/key.pem',
  },
};

local tlsEnabledNoKeyFile = {
  address: '0.0.0.0:1234',
  tls: {
    enabled: true,
    certFile: '/etc/ssl/stori/cert.pem',
  },
};

{
  'golden.json': golden,
  'tls-enabled-no-cert-file.json': tlsEnabledNoCertFile,
  'tls-enabled-no-key-file.json': tlsEnabledNoKeyFile,
}
