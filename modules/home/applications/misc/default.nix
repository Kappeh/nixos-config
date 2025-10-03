{ config, lib, ... }: {
  imports = [
    ./gparted.nix
    ./gqrx.nix
    ./monero_gui.nix
    ./qmk.nix
    ./qpwgraph.nix
    ./rssguard.nix
    ./rtl_sdr.nix
    ./via.nix
    ./wireshark.nix
    ./xarchiver.nix
  ];

  options.myModules.applications.misc.enable = lib.mkEnableOption "Enable misc applications";

  config.myModules.applications.misc = {
    gparted.enable = lib.mkDefault config.myModules.applications.misc.enable;
    gqrx.enable = lib.mkDefault config.myModules.applications.misc.enable;
    monero_gui.enable = lib.mkDefault config.myModules.applications.misc.enable;
    qmk.enable = lib.mkDefault config.myModules.applications.misc.enable;
    qpwgraph.enable = lib.mkDefault config.myModules.applications.misc.enable;
    rssguard.enable = lib.mkDefault config.myModules.applications.misc.enable;
    rtl_sdr.enable = lib.mkDefault config.myModules.applications.misc.enable;
    via.enable = lib.mkDefault config.myModules.applications.misc.enable;
    wireshark.enable = lib.mkDefault config.myModules.applications.misc.enable;
    xarchiver.enable = lib.mkDefault config.myModules.applications.misc.enable;
  };
}
