{ config, lib, pkgs, ... }: {
  options.kappeh.security.keepass_diff.enable = lib.mkEnableOption "Enable keepass-diff";

  config = lib.mkIf config.kappeh.security.keepass_diff.enable {
    home.packages = [ pkgs.keepass-diff ];
  };
}
