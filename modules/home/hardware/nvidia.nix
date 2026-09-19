{ config, lib, ... }: {
  options.kappeh.hardware.nvidia.enable = lib.mkEnableOption "Enable Nvidia";

  config.home = lib.mkIf config.kappeh.hardware.nvidia.enable {
    persistence."/persist".directories = [ ".cache/nvidia" ];
  };
}

