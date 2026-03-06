{ config, lib, ... }: {
  options.myModules.desktop.swww.enable = lib.mkEnableOption "Enable swww";

  config = lib.mkIf config.myModules.desktop.swww.enable {
    services.swww.enable = true;

    home.persistence."/persist".directories = [ ".cache/swww" ];
  };
}
