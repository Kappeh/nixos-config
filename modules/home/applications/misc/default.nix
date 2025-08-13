{ config, lib, ... }: {
  imports = [
    ./gparted.nix
    ./gqrx.nix
    ./qpwgraph.nix
    ./rtl_sdr.nix
    ./via.nix
    ./wireshark.nix
    ./xarchiver.nix
  ];

  options.myModules.applications.misc.enable = lib.mkEnableOption "Enable misc applications";

  config = lib.mkIf config.myModules.applications.misc.enable {
    myModules.applications.misc = {
      gparted.enable = lib.mkDefault true;
      gqrx.enable = lib.mkDefault true;
      qpwgraph.enable = lib.mkDefault true;
      rtl_sdr.enable = lib.mkDefault true;
      via.enable = lib.mkDefault true;
      wireshark.enable = lib.mkDefault true;
      xarchiver.enable = lib.mkDefault true;
    };
  };
}
