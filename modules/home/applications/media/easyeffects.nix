{ config, lib, ... }: {
  options.myModules.applications.media.easyeffects.enable = lib.mkEnableOption "Enable EasyEffects";

  config = lib.mkIf config.myModules.applications.media.easyeffects.enable {
    services.easyeffects = {
      enable = true;
      preset = "Default";
    };

    home.persistence."/persist/home/${config.home.username}" = {
      directories = [ ".config/easyeffects" ];
      files = [ ".config/easyeffectsrc" ];
    };
  };
}
