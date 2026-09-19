{ config, lib, ... }: {
  config = lib.mkIf config.kappeh.desktop.enable {
    home.persistence."/persist".directories = [ ".cache/awww" ];

    services.awww.enable = true;
  };
}

