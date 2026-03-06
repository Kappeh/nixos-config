{ config, lib, osConfig, ... }: {
  options.myModules.desktop.dconf.enable = lib.mkEnableOption "Enable Dconf";

  config = {
    # Disable Dconf Home Manager module if NixOS module is disabled
    myModules = lib.mkIf (!osConfig.myModules.desktop.dconf.enable) {
      desktop.dconf.enable = lib.mkForce false;
    };

    home = lib.mkIf config.myModules.desktop.dconf.enable {
      persistence."/persist".directories = [ ".config/dconf" ];
    };
  };
}
