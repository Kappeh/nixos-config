{ config, lib, ... }: {
  imports = [
    ./kieran.nix
  ];

  options.myModules.users.normal.enable = lib.mkEnableOption "Enable normal users";

  config.myModules.users.normal = {
    kieran.enable = lib.mkDefault config.myModules.users.normal.enable;
  };
}
