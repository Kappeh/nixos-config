{ config, lib, ... }: {
  imports = [
    ./dconf.nix
    ./greetd.nix
    ./hyprland.nix
    ./udisks.nix
  ];

  options.myModules.desktop.enable = lib.mkEnableOption "Enable desktop";

  config = {
    myModules.desktop = {
      dconf.enable = lib.mkDefault config.myModules.desktop.enable;
      greetd.enable = lib.mkDefault config.myModules.desktop.enable;
      hyprland.enable = lib.mkDefault config.myModules.desktop.enable;
      udisks.enable = lib.mkDefault config.myModules.desktop.enable;
    };

    xdg.terminal-exec.enable = config.myModules.desktop.enable;
  };
}
