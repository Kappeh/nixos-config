{ config, lib, pkgs, ... }: {
  options.kappeh.networking.wireshark.enable = lib.mkEnableOption "Enable Wireshark";

  config.home = lib.mkIf config.kappeh.networking.wireshark.enable {
    packages = [ pkgs.wireshark ];
  };
}

