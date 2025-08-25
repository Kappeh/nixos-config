{ config, lib, ... }: {
  imports = [
    ./appimage.nix
    ./bluetooth.nix
    ./fonts.nix
    ./home_manager.nix
    ./impermanence/default.nix
    ./libinput.nix
    ./logiops/default.nix
    ./networkmanager.nix
    ./nvidia.nix
    ./opengl.nix
    ./pipewire.nix
    ./sops.nix
    ./ssl/default.nix
    ./stylix.nix
    ./wireguard.nix
  ];

  options.myModules.core.enable = lib.mkEnableOption "Enable core";

  config = lib.mkIf config.myModules.core.enable {
    myModules.core = {
      appimage.enable = lib.mkDefault true;
      bluetooth.enable = lib.mkDefault true;
      fonts.enable = lib.mkDefault true;
      home_manager.enable = lib.mkDefault true;
      impermanence.enable = lib.mkDefault true;
      libinput.enable = lib.mkDefault true;
      logiops.enable = lib.mkDefault true;
      networkmanager.enable = lib.mkDefault true;
      nvidia.enable = lib.mkDefault true;
      opengl.enable = lib.mkDefault true;
      pipewire.enable = lib.mkDefault true;
      sops.enable = lib.mkDefault true;
      ssl.enable = lib.mkDefault true;
      wireguard.enable = lib.mkDefault true;
    };
  };
}
