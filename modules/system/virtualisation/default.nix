{ config, lib, ... }: {
  imports = [
    ./docker.nix
    ./qemu.nix
  ];

  options.myModules.virtualisation.enable = lib.mkEnableOption "Enable virtualisation";

  config = lib.mkIf config.myModules.virtualisation.enable {
    myModules.virtualisation = {
      docker.enable = lib.mkDefault true;
      qemu.enable = lib.mkDefault true;
    };
  };
}
