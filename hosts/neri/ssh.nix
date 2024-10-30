{ config, pkgs, ... }: {
  config.programs.ssh = {
    startAgent = true;
    setXAuthLocation = true;
    enableAskPassword = true;
    askPassword = "${pkgs.ssh-askpass-fullscreen}/bin/ssh-askpass-fullscreen";

    knownHosts = {
      "ciela" = {
        hostNames = [ "ciela.local" ];
        publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHOXu2r9mqPzDSgO2VoWj45xXsnJCqFYGrlui5qYK/0h ciela_host_key_ed25519";
      };
      "ciela_initrd" = {
        hostNames = [ "ciela.local" ];
        publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIL47+Wnncs1VEJBCkr1vzyC1g+P3SRW1jmLhoadu3PEO ciela_initrd_host_key_ed25519";
      };
    };
  };
}
