{ config, pkgs, ... }: {
  config.environment = {
    systemPackages = [ pkgs.logiops ];

    etc."logid.cfg" = {
      source = ./logid.cfg;
      mode = "0774";
    };
  };

  config.systemd.services.logid = {
    enable = true;

    description = "Run logid";
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      Type = "simple";
      Restart = "always";
      ExecStart = "${pkgs.logiops}/bin/logid";
    };
  };
}
