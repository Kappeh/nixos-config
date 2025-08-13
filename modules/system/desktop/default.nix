{ config, lib, ... }: {
  imports = [
    ./dconf.nix
    ./greetd.nix
    ./hyprland.nix
    ./udisks.nix
  ];

  options.myModules.desktop.enable = lib.mkEnableOption "Enable desktop";

  config = lib.mkIf config.myModules.desktop.enable {
    myModules.desktop = {
      dconf.enable = lib.mkDefault true;
      greetd.enable = lib.mkDefault true;
      hyprland.enable = lib.mkDefault true;
      udisks.enable = lib.mkDefault true;
    };

    xdg.terminal-exec.enable = true;
  };
}
