{ config, lib, ... }: {
  imports = [
    ./mpd.nix
    ./obs_studio.nix
  ];

  options.myModules.applications.media.enable = lib.mkEnableOption "Enable media applications";

  config.myModules.applications.media = {
    mpd.enable = lib.mkDefault config.myModules.applications.media.enable;
    obs_studio.enable = lib.mkDefault config.myModules.applications.media.enable;
  };
}
