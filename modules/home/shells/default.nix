{ config, lib, ... }: {
  imports = [
    ./bash/default.nix
    ./java/default.nix
    ./python/default.nix
    ./qmk/default.nix
    ./rust/default.nix
    ./zsh.nix
  ];

  options.myModules.shells.enable = lib.mkEnableOption "Enable shells";

  config = lib.mkIf config.myModules.shells.enable {
    myModules.shells = {
      zsh.enable = true;
    };
  };
}
