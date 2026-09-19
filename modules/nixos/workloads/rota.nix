{ config, lib, pkgs, ... }: {
  options.kappeh.workloads.rota.enable = lib.mkEnableOption "Enable rota workload";

  config = with config.kappeh.workloads; {
    users.users.rota = {
      name = "rota";
      uid = 2018;
      group = "rota";
      isNormalUser = false;
      isSystemUser = true;
      useDefaultShell = false;
      shell = pkgs.shadow;
    };

    users.groups.rota = {
      name = "rota";
      gid = 2018;
      members = [
        "rota"
        "kieran"
      ];
    };

    networking.firewall.allowedTCPPorts = lib.mkIf rota.enable [ 8089 ];

    systemd = lib.mkIf rota.enable {
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

