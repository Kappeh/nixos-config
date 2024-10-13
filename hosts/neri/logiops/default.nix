{ pkgs, ... }: {
  environment.systemPackages = [ pkgs.logiops ];

  environment.etc."logid.cfg" = {
    source = ./logid.cfg;
    mode = "0774";
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
}
