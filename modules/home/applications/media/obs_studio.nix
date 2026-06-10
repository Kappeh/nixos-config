{ config, lib, pkgs, ... }: {
  options.myModules.applications.media.obs_studio.enable = lib.mkEnableOption "Enable OBS Studio";

  config.programs.obs-studio = lib.mkIf config.myModules.applications.media.obs_studio.enable {
    enable = true;

    plugins = with pkgs.obs-studio-plugins; [
      obs-pipewire-audio-capture
    ];
  };
}
