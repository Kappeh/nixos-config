{ config, lib, osConfig, pkgs, ... }: {
  options.myModules.applications.misc.qpwgraph.enable = lib.mkEnableOption "Enable qpwgraph";

  config = lib.mkIf config.myModules.applications.misc.qpwgraph.enable {
    home = {
      packages = [ pkgs.qpwgraph ];

      persistence = lib.mkIf osConfig.myModules.core.impermanence.enable {
        "/persist/home/${config.home.username}".files = [
          "default.qpwgraph"
          ".config/rncbc.org/qpwgraph.conf"
        ];
      };
    };
  };
}
