{ config, lib, ... }: {
  options.kappeh.networking.ssh.enable = lib.mkEnableOption "Enable ssh";

  config.programs.ssh = lib.mkIf config.kappeh.networking.ssh.enable {
    startAgent = true;
    setXAuthLocation = true;
    enableAskPassword = true;

    knownHosts = {
      "leaf" = {
        hostNames = [ "leaf.home.kappeh.org" ];
        publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMuKy12mhjVzGb93FXgcaAARZT9bLDTte3D/AmfOkEex leaf_host_key_ed25519";
      };
    };
  };
}

