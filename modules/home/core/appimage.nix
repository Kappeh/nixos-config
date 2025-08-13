{ config, lib, osConfig, ... }: {
  options.myModules.core.appimage.enable = lib.mkEnableOption "Enable AppImage";

  config = {
    # Disable AppImage Home Manager module if NixOS module is disabled
    myModules = lib.mkIf (!osConfig.myModules.core.appimage.enable) {
      core.appimage.enable = lib.mkForce false;
    };

    home = lib.mkIf config.myModules.core.appimage.enable {
      persistence = lib.mkIf osConfig.myModules.core.impermanence.enable {
        "/persist/home/${config.home.username}".directories = [ ".cache/appimage-run" ];
      };
    };
  };
}
