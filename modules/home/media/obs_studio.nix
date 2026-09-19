{ config, lib, pkgs, ... }: {
  options.kappeh.media.obs_studio.enable = lib.mkEnableOption "Enable OBS Studio";

  config.programs.obs-studio = lib.mkIf config.kappeh.media.obs_studio.enable {
    enable = true;
    plugins = [
      pkgs.obs-studio-plugins.obs-pipewire-audio-capture
    ];
  };
}

