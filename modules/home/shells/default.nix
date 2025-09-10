{ config, lib, ... }: {
  imports = [
    ./bash/default.nix
    ./java/default.nix
    ./python/default.nix
    ./rust/default.nix
    ./zsh.nix
  ];

  options.myModules.shells.enable = lib.mkEnableOption "Enable shells";

  config.myModules.shells = {
    zsh.enable = lib.mkDefault config.myModules.shells.enable;
  };
}
