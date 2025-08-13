{ config, lib, osConfig, ... }: {
  options.myModules.core.pipewire.enable = lib.mkEnableOption "Enable PipeWire";

  config = {
    # Disable PipeWire Home Manager module if NixOS module is disabled
    myModules = lib.mkIf (!osConfig.myModules.core.pipewire.enable) {
      core.pipewire.enable = lib.mkForce false;
    };

    home = lib.mkIf config.myModules.core.pipewire.enable {
      persistence = lib.mkIf osConfig.myModules.core.impermanence.enable {
        "/persist/home/${config.home.username}".directories = [
          ".config/pulse" # I do not know whether this needs to stick around or not
          ".local/state/wireplumber"
        ];
      };
    };
  };
}
