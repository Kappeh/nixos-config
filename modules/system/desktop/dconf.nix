{ config, lib, ... }: {
  options.myModules.desktop.dconf.enable = lib.mkEnableOption "Enable Dconf";

  config = lib.mkIf config.myModules.desktop.dconf.enable {
    programs.dconf.enable = true;
  };
}
