{ pkgs, ... }: {
  config = {
    users = {
      users.rota = {
        uid = 2018;
        group = "rota";
        isNormalUser = false;
        isSystemUser = true;
        useDefaultShell = false;
        shell = pkgs.shadow;
      };
      groups.rota = {
        name = "rota";
        gid = 2018;
        members = [
          "rota"
          "kieran"
        ];
      };
    };
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
