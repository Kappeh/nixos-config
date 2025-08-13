{ config, lib, ... }: {
  imports = [
    ./zsh.nix
  ];

  options.myModules.shells.enable = lib.mkEnableOption "Enable shells";

  config = lib.mkIf config.myModules.shells.enable {
    myModules.shells = {
      zsh.enable = lib.mkDefault true;
    };
  };
}
