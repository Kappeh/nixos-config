{ config, lib, ... }: {
  imports = [
    ./certificates/default.nix
    ./sops.nix
  ];

  options.kappeh.security = {
    enable = lib.mkEnableOption "Enable security capability";

    gnupg.enable = lib.mkEnableOption "Enable gnupg";
    keepass_diff.enable = lib.mkEnableOption "Enable keepass-diff";
    keepassxc.enable = lib.mkEnableOption "Enable KeePassXC";
    ssh.enable = lib.mkEnableOption "Enable ssh";
  };

  config.kappeh.security = with config.kappeh; {
    gnupg.enable = lib.mkDefault security.enable;
    keepass_diff.enable = lib.mkDefault security.enable;
    keepassxc.enable = lib.mkDefault security.enable;
    ssh.enable = lib.mkDefault security.enable;
  };
}

