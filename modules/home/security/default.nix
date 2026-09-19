{ config, lib, ... }: {
  imports = [
    ./gnupg.nix
    ./keepass_diff.nix
    ./keepassxc.nix
    ./sops.nix
    ./ssh.nix
  ];

  options.kappeh.security.enable = lib.mkEnableOption "Enable security capability";

  config.kappeh.security = with config.kappeh; {
    gnupg.enable = lib.mkDefault security.enable;
    keepass_diff.enable = lib.mkDefault security.enable;
    keepassxc.enable = lib.mkDefault security.enable;
    ssh.enable = lib.mkDefault security.enable;
  };
}

