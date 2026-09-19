{ config, lib, pkgs, ... }: {
  options.kappeh.shell.wget.enable = lib.mkEnableOption "Enable wget";

  config = lib.mkIf config.kappeh.shell.wget.enable {
    home.packages = [ pkgs.wget ];
  };
}

