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

  # TODO probably move to a gnome file or something
  # dconf = {
  #   enable = true;
  #   settings = {
  #     "org/gnome/desktop/interface".color-scheme = "prefer-dark";
  #     "org/gnome/desktop/session".idle-delay = lib.hm.gvariant.mkUint32 0;
  #     "org/gnome/settings-daemon/plugins/power".sleep-inactive-ac-type = "nothing";
  #   };
  # };

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

      # Github Cli
      ".config/gh"

      # KeePassXC
      ".cache/keepassxc/" # Remember recent databases
      ".config/keepassxc/" # Remember settings e.g. password generator
      ".mozilla/native-messaging-hosts" # KeePassXC-Browser for firefox

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
      {
        directory = ".local/share/Steam";
        method = "symlink";
      }
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
}
