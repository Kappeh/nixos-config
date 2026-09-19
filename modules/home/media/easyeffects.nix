{ config, lib, ... }: {
  options.kappeh.media.easyeffects.enable = lib.mkEnableOption "Enable EasyEffects";

  config = lib.mkIf config.kappeh.media.easyeffects.enable {
    home.persistence."/persist" = {
      directories = [ ".config/easyeffects" ];
      files = [ ".config/easyeffectsrc" ];
    };

    services.easyeffects = {
      enable = true;
      preset = "Default";
    };
  };
}

