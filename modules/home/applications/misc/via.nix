{ config, lib, osConfig, pkgs, ... }: {
  options.myModules.applications.misc.via.enable = lib.mkEnableOption "Enable Via";

  config = {
    # Disable Via Home Manager module if  NixOS module is disabled
    myModules = lib.mkIf (!osConfig.myModules.applications.misc.via.enable) {
      applications.misc.via.enable = lib.mkForce false;
    };

    home = lib.mkIf config.myModules.applications.misc.via.enable {
      packages = [ pkgs.via ];
    };
  };
}
