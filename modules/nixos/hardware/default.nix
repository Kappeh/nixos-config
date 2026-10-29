{ lib, ... }: {
  imports = [
    ./logiops/default.nix
    ./bluetooth.nix
    ./firmware.nix
    ./intel.nix
    ./libinput.nix
    ./nvidia.nix
    ./opengl.nix
    ./upower.nix
    ./zram.nix
    ./zswap.nix
  ];

  options.kappeh.hardware.framework.enable = lib.mkEnableOption "Enable Framework tools";
}

