{ config, lib, pkgs, ... }: {
  options.myModules.applications.security.keepassxc.enable = lib.mkEnableOption "Enable KeePassXC";

  config = lib.mkIf config.myModules.applications.security.keepassxc.enable {
    home = {
      packages = [ pkgs.keepassxc ];

      persistence."/persist/home/${config.home.username}".directories = [
        ".cache/keepassxc/"
        ".config/keepassxc/"
      ];
    };
  };
}
