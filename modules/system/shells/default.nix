{ config, lib, ... }: {
  imports = [
    ./zsh.nix
  ];

  options.myModules.shells = {
    enable = lib.mkEnableOption "Enable all shells by default";

    rust.enable = lib.mkEnableOption "Enable Rust dev shell";
  };

  config.myModules.shells = {
    rust.enable = lib.mkDefault config.myModules.shells.enable;
    zsh.enable = lib.mkDefault config.myModules.shells.enable;
  };
}
