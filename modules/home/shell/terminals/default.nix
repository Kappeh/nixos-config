{ config, lib, pkgs, ... }: {
  imports = [
    ./alacritty.nix
    ./kitty.nix
  ];

  options.kappeh.shell.terminals.enable = lib.mkEnableOption "Enable terminal emulators";

  config = {
    # TODO find a better way to do this
    home.sessionVariables.XDG_TERMINAL = "${pkgs.alacritty}/bin/alacritty";

    kappeh.shell.terminals = with config.kappeh.shell; {
      alacritty.enable = lib.mkDefault terminals.enable;
      kitty.enable = lib.mkDefault terminals.enable;
    };
  };
}

