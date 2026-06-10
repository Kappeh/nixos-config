{ config, lib, pkgs, ... }: {
  options.myModules.applications.misc.wireshark.enable = lib.mkEnableOption "Enable Wireshark";

  config.home = lib.mkIf config.myModules.applications.misc.wireshark.enable {
    packages = [ pkgs.wireshark ];
  };
}
