{ config, lib, ... }: {
  imports = [
    ./blender.nix
    ./freecad.nix
  ];

  options.myModules.applications.modelling.enable = lib.mkEnableOption "Enable modelling applications";

  config.myModules.applications.modelling = {
    blender.enable = lib.mkDefault config.myModules.applications.modelling.enable;
    freecad.enable = lib.mkDefault config.myModules.applications.modelling.enable;
  };
}
