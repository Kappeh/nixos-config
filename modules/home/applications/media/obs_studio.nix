{ config, lib, osConfig, pkgs, ... }: {
  options.myModules.applications.media.obs_studio.enable = lib.mkEnableOption "Enable OBS Studio";

  config = {
    # Disable OBS Studio Home Manager module if NixOS module is disabled
    myModules = lib.mkIf (!osConfig.myModules.applications.media.obs_studio.enable) {
      applications.media.obs_studio.enable = lib.mkForce false;
    };

    programs.obs-studio = lib.mkIf config.myModules.applications.media.obs_studio.enable {
      enable = true;

      plugins = with pkgs.obs-studio-plugins; [
        obs-pipewire-audio-capture
      ];
    };
  };
}
