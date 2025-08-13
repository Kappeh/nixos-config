{ config, lib, pkgs, ... }: {
  options.myModules.applications.security.keepass_diff.enable = lib.mkEnableOption "Enable keepass-diff";

  config = lib.mkIf config.myModules.applications.security.keepass_diff.enable {
    home.packages = [ pkgs.keepass-diff ];
  };
}
