{ config, lib, ... }: {
  imports = [
    ./obs_studio.nix
  ];

  options.myModules.applications.media.enable = lib.mkEnableOption "Enable media applications";

  config.myModules.applications.media = {
    obs_studio.enable = lib.mkDefault config.myModules.applications.media.enable;
  };
}
