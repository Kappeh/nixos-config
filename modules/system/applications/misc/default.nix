{ config, lib, ... }: {
  imports = [
    ./qmk.nix
    ./rtl_sdr.nix
    ./via.nix
    ./wireshark.nix
  ];

  options.myModules.applications.misc.enable = lib.mkEnableOption "Enable misc applications";

  config.myModules.applications.misc = {
    qmk.enable = lib.mkDefault config.myModules.applications.misc.enable;
    rtl_sdr.enable = lib.mkDefault config.myModules.applications.misc.enable;
    via.enable = lib.mkDefault config.myModules.applications.misc.enable;
    wireshark.enable = lib.mkDefault config.myModules.applications.misc.enable;
  };
}
