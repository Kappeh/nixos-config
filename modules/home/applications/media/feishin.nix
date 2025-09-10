{ config, lib, pkgs, ... }: {
  options.myModules.applications.media.feishin.enable = lib.mkEnableOption "Enable Feishin";

  config = lib.mkIf config.myModules.applications.media.feishin.enable {
    home = {
      packages = [ pkgs.feishin ];

      persistence."/persist/home/${config.home.username}".directories = [ ".config/feishin" ];
    };
  };
}
