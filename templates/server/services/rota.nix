{ ... }: {
  config = {
    networking.firewall.allowedTCPPorts = [ 8089 ];

    systemd = {
      services."rota_scraper" = {
        serviceConfig = {
          Type = "oneshot";
          User = "root";
          WorkingDirectory = "/services/rota";
          ExecStart = "/run/current-system/sw/bin/docker compose up scraper";
          Environment = "PATH=/run/current-system/sw/bin";
        };
      };
      timers."rota_scraper" = {
        wantedBy = [ "timers.target" ];
        timerConfig = {
          OnCalendar = "hourly";
          Persistent = true;
          Unit = "rota_scraper.service";
        };
      };
    };
  };
}
