{ pkgs, ... }:
let
  run_backup_script = pkgs.writeScriptBin "run_backup" (builtins.readFile ./run_backup.sh);
in {
  environment.systemPackages = [ run_backup_script ];

  systemd = {
    timers."run_backup" = {
      wantedBy = [ "timers.target" ];
      timerConfig = {
        OnCalendar = "daily"; # Runs daily
        Persistent = true;    # Runs immediately if it missed the last start time
        Unit = "run_backup.service";
      };
    };
    services."run_backup" = {
      serviceConfig = {
        Type = "oneshot";
        User = "root";
        ExecStart = "${run_backup_script}/bin/run_backup";
        Environment = "PATH=/run/current-system/sw/bin";
      };
    };
  };
}
