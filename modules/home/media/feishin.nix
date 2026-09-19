{ config, lib, pkgs, ... }: {
  options.kappeh.media.feishin.enable = lib.mkEnableOption "Enable Feishin";

  config.home = lib.mkIf config.kappeh.media.feishin.enable {
    persistence."/persist".directories = [ ".config/feishin" ];

    packages = [ pkgs.feishin ];
  };
}

