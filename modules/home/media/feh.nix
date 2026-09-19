{ config, lib, ... }: {
  options.kappeh.media.feh.enable = lib.mkEnableOption "Enable feh";

  config = lib.mkIf config.kappeh.media.feh.enable {
    programs.feh.enable = true;
  };
}

