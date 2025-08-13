{ config, lib, ... }: {
  imports = [
    ./kieran.nix
  ];

  options.myModules.users.normal.enable = lib.mkEnableOption "Enable normal users";

  config = lib.mkIf config.myModules.users.normal.enable {
    myModules.users.normal.kieran.enable = lib.mkDefault true;
  };
}
