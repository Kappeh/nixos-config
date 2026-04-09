{ config, lib, ... }: {
  options.myModules.desktop.awww.enable = lib.mkEnableOption "Enable swww";

  config = lib.mkIf config.myModules.desktop.awww.enable {
    services.awww.enable = true;

    home.persistence."/persist".directories = [ ".cache/awww" ];
  };
}
