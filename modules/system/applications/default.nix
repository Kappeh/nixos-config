{ config, lib, ... }: {
  imports = [
    ./gaming/default.nix
    ./media/default.nix
    ./misc/default.nix
  ];

  options.myModules.applications.enable = lib.mkEnableOption "Enable applications";

  config = lib.mkIf config.myModules.applications.enable {
    myModules.applications = {
      gaming.enable = lib.mkDefault true;
      media.enable = lib.mkDefault true;
      misc.enable = lib.mkDefault true;
    };
  };
}
