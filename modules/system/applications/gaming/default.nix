{ config, lib, ... }: {
  imports = [
    ./alvr.nix
    ./gamemode.nix
    ./steam.nix
  ];

  options.myModules.applications.gaming.enable = lib.mkEnableOption "Enable gaming applications";

  config = lib.mkIf config.myModules.applications.gaming.enable {
    myModules.applications.gaming = {
      alvr.enable = lib.mkDefault true;
      gamemode.enable = lib.mkDefault true;
      steam.enable = lib.mkDefault true;
    };
  };
}
