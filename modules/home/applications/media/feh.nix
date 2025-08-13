{ config, lib, ... }: {
  options.myModules.applications.media.feh.enable = lib.mkEnableOption "Enable feh";

  config = lib.mkIf config.myModules.applications.media.feh.enable {
    programs.feh.enable = true;
  };
}
