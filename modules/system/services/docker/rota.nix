{ config, lib, ... }: {
  options.myModules.services.docker.rota.enable = lib.mkEnableOption "Enable rota service";

  config = lib.mkIf config.myModules.services.docker.rota.enable {
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
