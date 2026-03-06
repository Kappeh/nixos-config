{ config, lib, pkgs, ... }: {
  options.myModules.applications.misc.qpwgraph.enable = lib.mkEnableOption "Enable qpwgraph";

  config = lib.mkIf config.myModules.applications.misc.qpwgraph.enable {
    home = {
      packages = [ pkgs.qpwgraph ];

      persistence."/persist".files = [
        "default.qpwgraph"
        ".config/rncbc.org/qpwgraph.conf"
      ];
    };
  };
}
