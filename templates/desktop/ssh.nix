{ config, pkgs, ... }: {
  config.programs.ssh = {
    startAgent = true;
    setXAuthLocation = true;
    enableAskPassword = true;
    askPassword = "${pkgs.ssh-askpass-fullscreen}/bin/ssh-askpass-fullscreen";

    knownHosts = {
      "leaf" = {
        hostNames = [
          "leaf.illegal-crime.org"
          "leaf.home.kappeh.org"
        ];
        publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMuKy12mhjVzGb93FXgcaAARZT9bLDTte3D/AmfOkEex leaf_host_key_ed25519";
      };
    };
  };
}
