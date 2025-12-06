{ config, lib, ... }: {
  imports = [
    ./bash/default.nix
    ./rust/default.nix
    ./zsh.nix
  ];

  options.myModules.shells.enable = lib.mkEnableOption "Enable shells";

  config.myModules.shells = {
    rust.enable = lib.mkDefault config.myModules.shells.enable;
    zsh.enable = lib.mkDefault config.myModules.shells.enable;
  };
}
