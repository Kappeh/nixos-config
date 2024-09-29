{ pkgs, ... }: {
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    adwaita-qt
    adwaita-qt6
    beekeeper-studio
    cemu
    cemu-ti
    desmume
    dolphin-emu
    fceux
    fm
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

  # AppImage
  programs.appimage = {
    enable = true;
    binfmt = true;
  };

  # Clipcat
  services.clipcat.enable = true;

  # Gamemode
  programs.gamemode = {
    enable = true;
    settings = {
      general.renice = 10;
    };
  };

  # Noisetorch
  programs.noisetorch.enable = true;

  # Qmk/Via
  hardware.keyboard.qmk.enable = true;
  services.udev.packages = with pkgs; [ via ];

  # Rtl-sdr
  hardware.rtl-sdr.enable = true;

  # SSH
  programs.ssh = {
    startAgent = true;
    setXAuthLocation = true;
    enableAskPassword = true;
    askPassword = "${pkgs.ssh-askpass-fullscreen}/bin/ssh-askpass-fullscreen";
  };

  # Wireshark
  programs.wireshark.enable = true;

  # Zsh
  programs.zsh.enable = true;
}
