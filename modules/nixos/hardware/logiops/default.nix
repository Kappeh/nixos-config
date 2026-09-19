{ config, lib, pkgs, ... }: {
  options.kappeh.hardware.logiops.enable = lib.mkEnableOption "Enable logiops";

  config = lib.mkIf config.kappeh.hardware.logiops.enable {
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
