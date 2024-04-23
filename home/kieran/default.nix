{ lib, inputs, ... }: {
  home = {
    homeDirectory = "/home/kieran";
    username = "kieran";
    stateVersion = "23.11";
  };

  imports = [
    inputs.impermanence.nixosModules.home-manager.impermanence

    ./btop.nix
    ./firefox.nix
    ./gh.nix
    ./git.nix
    ./syncthing.nix
    ./vscodium.nix
  ];

  # TODO probably move to a gnome file or something
  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface".color-scheme = "prefer-dark";
      "org/gnome/desktop/session".idle-delay = lib.hm.gvariant.mkUint32 0;
      "org/gnome/settings-daemon/plugins/power".sleep-inactive-ac-type = "nothing";
    };
  };

  home.persistence."/persist/home/kieran" = {
    directories = [
      "dotfiles"
      "Desktop"
      "Downloads"
      "Music"
      "Pictures"
      "Documents"
      "Videos"
      "VirtualBox VMs"
      "dev"
      ".gnupg"
      ".ssh"
      ".nixops"
      ".local/share/keyrings"
      ".local/share/direnv"
      # Firefox
      ".mozilla/firefox/default/"
      # Syncthing
      "Sync"
      ".local/state/syncthing"
      # KeePassXC
      ".cache/keepassxc/"
      ".config/keepassxc/"
      ".mozilla/native-messaging-hosts"
      # Pywal
      ".cache/wal"
      # PrismLauncher
      ".local/share/PrismLauncher"
      # Github Cli
      ".config/gh"
      {
        directory = ".local/share/Steam";
        method = "symlink";
      }
    ];
    files = [
      ".screenrc"
      ".bash_history"
      ".config/monitors.xml"
      ".config/monitors.xml~"
      ".config/sops/age/keys.txt"
    ];
    allowOther = true; # Allow other users, such as root, to access files.
  };
}
