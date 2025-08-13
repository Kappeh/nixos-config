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

  config = lib.mkIf config.myModules.core.enable {
    myModules.core = {
      appimage.enable = lib.mkDefault true;
      fontcache.enable = lib.mkDefault true;
      gnupg.enable = lib.mkDefault true;
      hunspell.enable = lib.mkDefault true;
      numlock.enable = lib.mkDefault true;
      pipewire.enable = lib.mkDefault true;
      sops.enable = lib.mkDefault true;
      ssh.enable = lib.mkDefault true;
      syncthing.enable = lib.mkDefault true;
    };
  };
}
