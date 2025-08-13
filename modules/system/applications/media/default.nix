{ config, lib, ... }: {
  imports = [
    ./obs_studio.nix
  ];

  options.myModules.applications.media.enable = lib.mkEnableOption "Enable media applications";

  config = lib.mkIf config.myModules.applications.media.enable {
    myModules.applications.media.obs_studio.enable = lib.mkDefault true;
  };
}
