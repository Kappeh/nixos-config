{ config, pkgs, ... }: {
  config.security.pki.certificateFiles = [
    "${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt"
    ./local-ca-cert.pem
  ];
}
