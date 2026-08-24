{ config, lib, ... }: {
  config = lib.mkIf config.myModules.desktop.enable {
    services.awww.enable = true;

    home.persistence."/persist".directories = [ ".cache/awww" ];
  };
}
