{ config, lib, pkgs, ... }: {
  options.kappeh.shell.tree.enable = lib.mkEnableOption "Enable tree";

  config = lib.mkIf config.kappeh.shell.tree.enable {
    home.packages = [ pkgs.tree ];
  };
}

