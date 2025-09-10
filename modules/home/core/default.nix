{ config, lib, ... }: {
  imports = [
    ./appimage.nix
    ./fontcache.nix
    ./gnupg.nix
    ./hunspell.nix
    ./numlock.nix
    ./pipewire.nix
    ./sops.nix
    ./ssh.nix
    ./syncthing.nix
  ];

  options.myModules.core.enable = lib.mkEnableOption "Enable core";

  config.myModules.core = {
    appimage.enable = lib.mkDefault config.myModules.core.enable;
    fontcache.enable = lib.mkDefault config.myModules.core.enable;
    gnupg.enable = lib.mkDefault config.myModules.core.enable;
    hunspell.enable = lib.mkDefault config.myModules.core.enable;
    numlock.enable = lib.mkDefault config.myModules.core.enable;
    pipewire.enable = lib.mkDefault config.myModules.core.enable;
    sops.enable = lib.mkDefault config.myModules.core.enable;
    ssh.enable = lib.mkDefault config.myModules.core.enable;
    syncthing.enable = lib.mkDefault config.myModules.core.enable;
  };
}
