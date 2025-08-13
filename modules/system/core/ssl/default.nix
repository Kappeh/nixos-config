{ config, lib, pkgs, ... }: {
  options.myModules.core.ssl.enable = lib.mkEnableOption "Import personal SSL certificate authority";

  config = lib.mkIf config.myModules.core.ssl.enable {
    security.pki.certificateFiles = [
      "${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt"
      ./local-ca-cert.pem
    ];
  };
}
