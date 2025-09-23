{ config, lib, ... }: {
  imports = [
    ./normal/default.nix
    ./system/default.nix
  ];

  config.myModules.users = {
    normal.enable = lib.mkDefault true;
    system.enable = lib.mkDefault false;
  };
}
