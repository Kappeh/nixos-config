{ config, lib, pkgs, ... }: {
  options.kappeh.security.keepassxc.enable = lib.mkEnableOption "Enable KeePassXC";

  config.home = lib.mkIf config.kappeh.security.keepassxc.enable {
    persistence."/persist".directories = [
      ".cache/keepassxc/"
      ".config/keepassxc/"
    ];

    packages = [ pkgs.keepassxc ];
  };
}
