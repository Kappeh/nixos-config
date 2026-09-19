{ config, lib, pkgs, ... }: {
  config = lib.mkIf config.kappeh.audio.enable {
    home = {
      persistence."/persist".files = [
        "default.qpwgraph"
        ".config/rncbc.org/qpwgraph.conf"
      ];
      packages = [ pkgs.qpwgraph ];
    };
  };
}

