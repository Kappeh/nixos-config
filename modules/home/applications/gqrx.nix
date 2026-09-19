{ config, lib, pkgs, ... }: {
  options.kappeh.applications.gqrx.enable = lib.mkEnableOption "Enable Gqrx";

  config.home = lib.mkIf config.kappeh.applications.gqrx.enable {
    persistence."/persist".directories = [ ".config/gqrx" ];

    packages = [ pkgs.gqrx ];
  };
}

