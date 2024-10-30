{ config, pkgs, ... }: {
  config.services.udev.packages = [ pkgs.via ];
}
