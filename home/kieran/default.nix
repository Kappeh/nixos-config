{ lib, inputs, ... }: {
  home = {
    homeDirectory = "/home/kieran";
    username = "kieran";
    stateVersion = "23.11";
  };

  imports = [
    inputs.impermanence.nixosModules.home-manager.impermanence

    ./alacritty.nix
    ./bash/default.nix
    ./btop.nix
    ./feh.nix
    ./firefox.nix
    ./gh.nix
    ./git.nix
    ./pywal.nix
    ./rofi.nix
    ./syncthing.nix
    ./vscodium.nix
  ];

  home.persistence."/persist/home/kieran" = {
    directories = [
      # Custom files
      "dotfiles"
      "dev"

      # Standard files
      "Desktop"
      "Downloads"
      "Music"
      "Pictures"
      "Documents"
      "Videos"
      # "VirtualBox VMs"
      ".gnupg"
      ".ssh"
      ".nixops"
      ".local/share/keyrings"
      # ".local/share/direnv"

      # Discord - to stop it opening browser each boot and remember settings
      ".config/discord"

      # Firefox - to keep addons enabled and remember addon settings
      ".mozilla/firefox/default/"
      ".mozilla/native-messaging-hosts" # KeePassXC-Browser for firefox

      # Github Cli
      ".config/gh"

      # KeePassXC
      ".cache/keepassxc/" # Remember recent databases
      ".config/keepassxc/" # Remember settings e.g. password generator

      # PrismLauncher
      ".local/share/PrismLauncher"

      # Pywal
      ".cache/wal"

      # Custom cache for background management scripts
      ".cache/background"

      # Rustup - to prevent having to reinstalling toolchain
      ".rustup"

      # Syncthing
      "Sync"
      ".local/state/syncthing"
    ];
    files = [
      ".bash_history"
      ".config/monitors.xml"
      ".config/monitors.xml~"
      ".config/sops/age/keys.txt"
      ".screenrc"
    ];
    allowOther = true; # Allow other users, such as root, to access files.
  };

  home.persistence."/mnt/sshd0p1_persist/home/kieran" = {
    directories = [
      {
        directory = ".local/share/Factorio";
        method = "symlink";
      }
      {
        directory = ".factorio";
        method = "symlink";
      }
      {
        directory = ".local/share/FasterThanLight";
        method = "symlink";
      }
      {
        directory = ".local/share/IntoTheBreach";
        method = "symlink";
      }
      {
        directory = ".local/share/Terraria";
        method = "symlink";
      }
      {
        directory = ".local/share/Steam";
        method = "symlink";
      }
    ];
    files = [];
    allowOther = true; # Allow other users, such as root, to access files.
  };
}
