{ config, lib, pkgs, ... }: {
  options.kappeh.development.nix_output_monitor.enable = lib.mkEnableOption "Enable nix-output-monitor";

  config = lib.mkIf config.kappeh.development.nix_output_monitor.enable {
    home.packages = [ pkgs.nix-output-monitor ];
  };
}

