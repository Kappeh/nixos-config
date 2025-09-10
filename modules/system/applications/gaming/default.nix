{ config, lib, ... }: {
  imports = [
    ./alvr.nix
    ./gamemode.nix
    ./steam.nix
  ];

  options.myModules.applications.gaming.enable = lib.mkEnableOption "Enable gaming applications";

  config.myModules.applications.gaming = {
    alvr.enable = lib.mkDefault config.myModules.applications.gaming.enable;
    gamemode.enable = lib.mkDefault config.myModules.applications.gaming.enable;
    steam.enable = lib.mkDefault config.myModules.applications.gaming.enable;
  };
}
