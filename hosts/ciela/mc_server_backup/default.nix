{pkgs, ...}:
let
  mark_daily_mc_server_backup_script = pkgs.writeScriptBin "mark_daily_mc_server_backup" (builtins.readFile ./mark_daily_mc_server_backup.sh);
  run_mc_server_backup_script = pkgs.writeScriptBin "run_mc_server_backup" (builtins.readFile ./run_mc_server_backup.sh);
in {
  environment.systemPackages = [
    mark_daily_mc_server_backup_script
    run_mc_server_backup_script
  ];

  systemd = {
    timers = {
      "mark_daily_mc_server_backup" = {
        wantedBy = [ "timers.target" ];
        timerConfig = {
          OnCalendar = "daily";
          Persistent = true;
          Unit = "mark_daily_mc_server_backup.service";
        };
      };
      "run_mc_server_backup" = {
        wantedBy = [ "timers.target" ];
        timerConfig = {
          OnCalendar = "hourly";
          Persistent = true;
          Unit = "run_mc_server_backup.service";
        };
      };
    };
    services = {
      "mark_daily_mc_server_backup" = {
        serviceConfig = {
          Type = "oneshot";
          User = "root";
          ExecStart = "${mark_daily_mc_server_backup_script}/bin/mark_daily_mc_server_backup";
          Environment = "PATH=/run/current-system/sw/bin";
        };
      };
      "run_mc_server_backup" = {
        serviceConfig = {
          Type = "oneshot";
          User = "root";
          ExecStart = "${run_mc_server_backup_script}/bin/run_mc_server_backup";
          Environment = "PATH=/run/current-system/sw/bin";
        };
      };
    };
  };
}
