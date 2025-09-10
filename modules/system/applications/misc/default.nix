{ config, lib, ... }: {
  imports = [
    ./droidcam.nix
    ./qmk.nix
    ./rtl_sdr.nix
    ./via.nix
    ./wireshark.nix
    ./xmrig.nix
  ];

  options.myModules.applications.misc.enable = lib.mkEnableOption "Enable misc applications";

  config = lib.mkIf config.myModules.applications.misc.enable {
    myModules.applications.misc = {
      droidcam.enable = lib.mkDefault true;
      qmk.enable = lib.mkDefault true;
      rtl_sdr.enable = lib.mkDefault true;
      via.enable = lib.mkDefault true;
      wireshark.enable = lib.mkDefault true;
      xmrig.enable = lib.mkDefault true;
    };
  };
}
