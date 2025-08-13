{ config, lib, pkgs, ... }: {
  imports = [
    ./alacritty.nix
  ];

  options.myModules.applications.terminals.enable = lib.mkEnableOption "Enable terminal emulators";

  config = lib.mkIf config.myModules.applications.terminals.enable {
    myModules.applications.terminals = {
      alacritty.enable = lib.mkDefault true;
    };

    # TODO find a better way to do this
    home.sessionVariables.XDG_TERMINAL = "${pkgs.alacritty}/bin/alacritty";
  };
}
