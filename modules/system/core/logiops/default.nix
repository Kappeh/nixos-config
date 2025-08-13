{ config, lib, pkgs, ... }: {
  options.myModules.core.logiops.enable = lib.mkEnableOption "Enable logiops";

  config = lib.mkIf config.myModules.core.logiops.enable {
    environment = {
      systemPackages = [ pkgs.logiops ];

      etc."logid.cfg" = {
        source = ./logid.cfg;
        mode = "0774";
      };
    };

    systemd.services.logid = {
      enable = true;

      description = "Run logid";
      wantedBy = [ "multi-user.target" ];
      serviceConfig = {
        Type = "simple";
        Restart = "always";
        ExecStart = "${pkgs.logiops}/bin/logid";
      };
    };
  };
}
