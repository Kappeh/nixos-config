{ config, lib, pkgs, ... }: {
  imports = [
    ./alacritty.nix
    ./kitty.nix
  ];

  options.myModules.applications.terminals.enable = lib.mkEnableOption "Enable terminal emulators";

  config = {
    myModules.applications.terminals = {
      alacritty.enable = lib.mkDefault config.myModules.applications.terminals.enable;
      kitty.enable = lib.mkDefault config.myModules.applications.terminals.enable;
    };

    # TODO find a better way to do this
    home.sessionVariables.XDG_TERMINAL = "${pkgs.alacritty}/bin/alacritty";
  };
}
