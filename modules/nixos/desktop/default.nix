{ lib, ... }: {
  imports = [
    ./dconf.nix
    ./greetd.nix
    ./hyprland.nix
    ./udisks.nix
    ./xdg_terminal_exec.nix
  ];

  options.kappeh.desktop.enable = lib.mkEnableOption "Enable desktop capability";
}

