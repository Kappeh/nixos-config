{ config, lib, ... }: {
  imports = [
    ./kieran.nix # 1000
  ];

  options.myModules.users = {
    normal.enable = lib.mkEnableOption "Enable normal users";
  };

  config.myModules.users = {
    normal.enable = lib.mkDefault true;
    normal.kieran.enable = lib.mkDefault config.myModules.users.normal.enable;
  };
}
