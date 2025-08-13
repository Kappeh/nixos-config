{ config, lib, ... }: {
  imports = [
    ./davinci_resolve.nix
    ./easyeffects.nix
    ./feh.nix
    ./feishin.nix
    ./gimp.nix
    ./jellyfin_media_player.nix
    ./libreoffice.nix
    ./obs_studio.nix
    ./vlc.nix
  ];

  options.myModules.applications.media.enable = lib.mkEnableOption "Enable media applications";

  config = lib.mkIf config.myModules.applications.media.enable {
    myModules.applications.media = {
      davinci_resolve.enable = lib.mkDefault true;
      easyeffects.enable = lib.mkDefault true;
      feh.enable = lib.mkDefault true;
      feishin.enable = lib.mkDefault true;
      gimp.enable = lib.mkDefault true;
      jellyfin_media_player.enable = lib.mkDefault true;
      libreoffice.enable = lib.mkDefault true;
      obs_studio.enable = lib.mkDefault true;
      vlc.enable = lib.mkDefault true;
    };
  };
}
