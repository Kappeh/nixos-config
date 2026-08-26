{ config, lib, ... }: {
  imports = [
    ./docker.nix
  ];

  options.myModules.virtualisation.enable = lib.mkEnableOption "Enable virtualisation";

  config.myModules.virtualisation = {
    docker.enable = lib.mkDefault config.myModules.virtualisation.enable;
  };
}
