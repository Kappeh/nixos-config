{ config, lib, pkgs, ... }: {
  options.kappeh.communication.protonmail_desktop.enable = lib.mkEnableOption "Enable Proton Mail desktop";

  config = lib.mkIf config.kappeh.communication.protonmail_desktop.enable {
    home = {
      persistence."/persist".directories = [ ".config/Proton Mail" ];

      packages = [ pkgs.protonmail-desktop ];
    };
  };
}

