{ config, lib, ... }: {
  imports = [
    ./appimage.nix
    ./bluetooth.nix
    ./fonts.nix
    ./home_manager.nix
    ./impermanence/default.nix
    ./libinput.nix
    ./locale.nix
    ./logiops/default.nix
    ./nix.nix
    ./nvidia.nix
    ./opengl.nix
    ./pipewire.nix
    ./sops.nix
    ./ssl/default.nix
    ./stylix.nix
    ./systemd_boot.nix
    ./upower.nix
    ./vim.nix
    ./wireguard.nix
  ];

  options.myModules.core = {
    enable = lib.mkEnableOption "Enable all core modules by default";

    fontcache.enable = lib.mkEnableOption "Persist font cache";
    gnupg.enable = lib.mkEnableOption "Enable GNU Privacy Guard";
    hunspell.enable = lib.mkEnableOption "Enable Hunspell";
    numlock.enable = lib.mkEnableOption "Enable Numlock";
    ssh.enable = lib.mkEnableOption "Enable SSH";
    syncthing.enable = lib.mkEnableOption "Enable Syncthing";
  };

  config.myModules.core = {
    appimage.enable = lib.mkDefault config.myModules.core.enable;
    bluetooth.enable = lib.mkDefault config.myModules.core.enable;
    fontcache.enable = lib.mkDefault config.myModules.core.enable;
    fonts.enable = lib.mkDefault config.myModules.core.enable;
    gnupg.enable = lib.mkDefault config.myModules.core.enable;
    home_manager.enable = lib.mkDefault config.myModules.core.enable;
    hunspell.enable = lib.mkDefault config.myModules.core.enable;
    impermanence.enable = lib.mkDefault config.myModules.core.enable;
    libinput.enable = lib.mkDefault config.myModules.core.enable;
    logiops.enable = lib.mkDefault config.myModules.core.enable;
    numlock.enable = lib.mkDefault config.myModules.core.enable;
    nvidia.enable = lib.mkDefault config.myModules.core.enable;
    opengl.enable = lib.mkDefault config.myModules.core.enable;
    pipewire.enable = lib.mkDefault config.myModules.core.enable;
    sops.enable = lib.mkDefault config.myModules.core.enable;
    ssh.enable = lib.mkDefault config.myModules.core.enable;
    ssl.enable = lib.mkDefault config.myModules.core.enable;
    syncthing.enable = lib.mkDefault config.myModules.core.enable;
    systemd_boot.enable = lib.mkDefault config.myModules.core.enable;
    upower.enable = lib.mkDefault config.myModules.core.enable;
    wireguard.enable = lib.mkDefault config.myModules.core.enable;
  };
}
