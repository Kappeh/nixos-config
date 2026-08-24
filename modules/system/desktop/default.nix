{ lib, ... }: {
  imports = [
    ./dconf.nix
    ./greetd.nix
    ./hyprland.nix
    ./udisks.nix
    ./xdg_terminal_exec.nix
  ];

  options.myModules.desktop.enable = lib.mkEnableOption "Enable all desktop";
}
