{ config, pkgs, ... }: {
  imports = [
    ../../modules/system/hardware/qmk.nix
    ../../modules/system/hardware/rtl_sdr.nix
    ../../modules/system/programs/appimage.nix
    ../../modules/system/programs/clipcat.nix
    ../../modules/system/programs/gamemode.nix
    ../../modules/system/programs/noisetorch.nix
    ../../modules/system/programs/via.nix
    ../../modules/system/programs/wireshark.nix
    ../../modules/system/programs/zsh.nix
  ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  config.environment.systemPackages = with pkgs; [
    adwaita-qt
    adwaita-qt6
    beekeeper-studio
    cemu
    desmume
    dolphin-emu
    fceux
    gnome-themes-extra
    libnotify
    libretro.citra
    mgba
    mupen64plus
    snes9x
    tldr
    unzip
    via
    vim
    wget
    zip
  ];
}
