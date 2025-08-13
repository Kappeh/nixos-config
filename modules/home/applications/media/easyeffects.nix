{ config, lib, osConfig, ... }: {
  options.myModules.applications.media.easyeffects.enable = lib.mkEnableOption "Enable EasyEffects";

  config = lib.mkIf config.myModules.applications.media.easyeffects.enable {
    services.easyeffects = {
      enable = true;
      preset = "Default";
    };

    home.persistence = lib.mkIf osConfig.myModules.core.impermanence.enable {
      "/persist/home/${config.home.username}".directories = [ ".config/easyeffects" ];
    };
  };
}
