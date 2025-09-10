{ config, lib, pkgs, ... }: {
  options.myModules.applications.modelling.blender.enable = lib.mkEnableOption "Enable Blender";

  config = lib.mkIf config.myModules.applications.modelling.blender.enable {
    home = {
      packages = [ pkgs.blender ];

      persistence."/persist/home/${config.home.username}".directories = [
        ".cache/blender"
        ".config/blender"
      ];
    };
  };
}
