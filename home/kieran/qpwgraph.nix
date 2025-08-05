{ config, pkgs, ... }: {
  config.home = {
    packages = [ pkgs.qpwgraph ];

    persistence."/persist/home/kieran".files = [
      "default.qpwgraph"
      ".config/rncbc.org/qpwgraph.conf"
    ];
  };
}
