{ config, lib, ... }: {
  options.myModules.core.nvidia.enable = lib.mkEnableOption "Enable Nvidia";

  config.home = lib.mkIf config.myModules.core.nvidia.enable {
    persistence."/persist".directories = [ ".cache/nvidia" ];
  };
}
