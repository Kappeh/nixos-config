{ config, lib, ... }: {
  imports = [
    ./zsh.nix
  ];

  options.myModules.shells.enable = lib.mkEnableOption "Enable shells";

  config.myModules.shells = {
    zsh.enable = lib.mkDefault config.myModules.shells.enable;
  };
}
