{ lib, ... }: {
  imports = [
    ./dconf.nix
    ./greetd.nix
    ./hyprland.nix
    ./options.nix
    ./udisks.nix
    ./xdg_terminal_exec.nix
  ];

  options.kappeh.desktop.enable = lib.mkEnableOption "Enable desktop capability";
}

