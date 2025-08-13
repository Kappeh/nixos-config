{ config, lib, osConfig, pkgs, ... }: {
  options.myModules.applications.misc.wireshark.enable = lib.mkEnableOption "Enable Wireshark";

  config = {
    # Disable Wireshark Home Manager module if NixOS module is disabled
    myModules = lib.mkIf (!osConfig.myModules.applications.misc.wireshark.enable) {
      applications.misc.wireshark.enable = lib.mkForce false;
    };

    home = lib.mkIf config.myModules.applications.misc.wireshark.enable {
      packages = [ pkgs.wireshark ];
    };
  };
}
