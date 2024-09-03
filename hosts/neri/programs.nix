{ pkgs, ... }: {
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    adwaita-qt
    adwaita-qt6
    gnome-themes-extra
    via
    vim
    wget
  ];

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
}