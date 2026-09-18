{ config, lib, pkgs, ... }: {
  options.myModules.applications.messaging.protonmail_desktop.enable = lib.mkEnableOption "Enable Proton Mail desktop";

  config = lib.mkIf config.myModules.applications.messaging.protonmail_desktop.enable {
    home = {
      packages = [ pkgs.protonmail-desktop ];
      persistence."/persist".directories = [ ".config/Proton Mail" ];
    };
  };
}
