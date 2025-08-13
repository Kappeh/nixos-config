{ config, pkgs, ... }: let
  script = pkgs.writeScriptBin "illegal_crime_mc_run_backup" (builtins.readFile ./run_backup.sh);
in {
  config = {
    # environment.systemPackages = [ script ];
    systemd = {
      services."illegal_crime_mc_run_backup" = {
        serviceConfig = {
          Type = "oneshot";
          User = "root";
          ExecStart = "${script}/bin/illegal_crime_mc_run_backup";
          Environment = "PATH=/run/current-system/sw/bin";
        };
      };
      timers."illegal_crime_mc_run_backup" = {
        wantedBy = [ "timers.target" ];
        timerConfig = {
          OnCalendar = "hourly";
          Persistent = true;
          Unit = "illegal_crime_mc_run_backup.service";
        };
      };
    };
  };
}
