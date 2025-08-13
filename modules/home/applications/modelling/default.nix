{ config, lib, ... }: {
  imports = [
    ./blender.nix
    ./freecad.nix
  ];

  options.myModules.applications.modelling.enable = lib.mkEnableOption "Enable modelling applications";

  config = lib.mkIf config.myModules.applications.modelling.enable {
    myModules.applications.modelling = {
      blender.enable = lib.mkDefault true;
      freecad.enable = lib.mkDefault true;
    };
  };
}
