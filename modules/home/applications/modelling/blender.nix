{ config, lib, osConfig, pkgs, ... }: {
  options.myModules.applications.modelling.blender.enable = lib.mkEnableOption "Enable Blender";

  config = lib.mkIf config.myModules.applications.modelling.blender.enable {
    home = {
      packages = [ pkgs.blender ];

      persistence = lib.mkIf osConfig.myModules.core.impermanence.enable {
        "/persist/home/${config.home.username}".directories = [
          ".cache/blender"
          ".config/blender"
        ];
      };
    };
  };
}
