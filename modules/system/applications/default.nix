{ config, lib, ... }: {
  imports = [
    ./gaming/default.nix
    ./media/default.nix
    ./misc/default.nix
  ];

  options.myModules.applications.enable = lib.mkEnableOption "Enable applications";

  config.myModules.applications = {
    gaming.enable = lib.mkDefault config.myModules.applications.enable;
    media.enable = lib.mkDefault config.myModules.applications.enable;
    misc.enable = lib.mkDefault config.myModules.applications.enable;
  };
}
