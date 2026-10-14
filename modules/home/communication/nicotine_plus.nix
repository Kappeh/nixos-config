{ config, lib, pkgs, ...}: {
  options.kappeh.communication.nicotine_plus.enable = lib.mkEnableOption "Enable Nicotine+";

  config = lib.mkIf config.kappeh.communication.nicotine_plus.enable {
    home.packages = [ pkgs.nicotine-plus ];

    home.persistence."/persist".directories = [
      ".config/nicotine"
      ".local/share/nicotine"
    ];
  };
}

