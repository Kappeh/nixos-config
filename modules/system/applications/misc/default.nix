{ config, lib, ... }: {
  imports = [
    ./qmk.nix
    ./rtl_sdr.nix
    ./via.nix
    ./wireshark.nix
  ];

  options.myModules.applications.misc = {
    enable = lib.mkEnableOption "Enable all misc applications by default";

    gqrx.enable = lib.mkEnableOption "Enable Gqrx";
    qalculate.enable = lib.mkEnableOption "Enable Qalculate!";
    qpwgraph.enable = lib.mkEnableOption "Enable qpwgraph";
    xarchiver.enable = lib.mkEnableOption "Enable Xarchiver";
  };

  config.myModules.applications.misc = {
    gqrx.enable = lib.mkDefault config.myModules.applications.misc.enable;
    qalculate.enable = lib.mkDefault config.myModules.applications.misc.enable;
    qmk.enable = lib.mkDefault config.myModules.applications.misc.enable;
    qpwgraph.enable = lib.mkDefault config.myModules.applications.misc.enable;
    rtl_sdr.enable = lib.mkDefault config.myModules.applications.misc.enable;
    via.enable = lib.mkDefault config.myModules.applications.misc.enable;
    wireshark.enable = lib.mkDefault config.myModules.applications.misc.enable;
    xarchiver.enable = lib.mkDefault config.myModules.applications.misc.enable;
  };
}
