{ config, lib, osConfig, ... }: {
  options.myModules.core.nvidia.enable = lib.mkEnableOption "Enable Nvidia";

  config = {
    # Disable Nvidia Home Manager module if NixOS module is disabled
    myModules = lib.mkIf (!osConfig.myModules.core.nvidia.enable) {
      core.nvidia.enable = lib.mkForce false;
    };

    home = lib.mkIf config.myModules.core.nvidia.enable {
      persistence."/persist/home/${config.home.username}".directories = [ ".cache/nvidia" ];
    };
  };
}
