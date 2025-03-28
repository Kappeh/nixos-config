{ config, pkgs, ... }: let
  script = pkgs.writeScriptBin "illegal_crime_mc_mark_daily_backup" (builtins.readFile ./mark_daily_backup.sh);
in {
  config = {
    # environment.systemPackages = [ script ];
    systemd = {
      services."illegal_crime_mc_mark_daily_backup" = {
        serviceConfig = {
          Type = "oneshot";
          User = "root";
          ExecStart = "${script}/bin/illegal_crime_mc_mark_daily_backup";
          Environment = "PATH=/run/current-system/sw/bin";
        };
      };
      timers."illegal_crime_mc_mark_daily_backup" = {
        wantedBy = [ "timers.target" ];
        timerConfig = {
          OnCalendar = "daily";
          Persistent = true;
          Unit = "illegal_crime_mc_mark_daily_backup.service";
        };
      };
    };
  };
}
