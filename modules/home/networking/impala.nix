{ config, lib, ... }: {
  options.kappeh.networking.impala.enable = lib.mkEnableOption "Enable impala";

  config = lib.mkIf config.kappeh.networking.impala.enable {
    programs.impala = {
      enable = true;
      settings = { };
    };
  };
}

