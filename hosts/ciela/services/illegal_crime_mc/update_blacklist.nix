{ config, pkgs, ... }: let
  script = pkgs.writeScriptBin "illegal_crime_mc_update_blacklist" (builtins.readFile ./update_blacklist.sh);
in {
  config = {
    environment.systemPackages = [
      pkgs.ipset
      pkgs.whois
      # script
    ];
    systemd = {
      services."illegal_crime_mc_update_blacklist" = {
        serviceConfig = {
          Type = "oneshot";
          User = "root";
          ExecStart = "${script}/bin/illegal_crime_mc_update_blacklist";
          Environment = "PATH=/run/current-system/sw/bin";
        };
      };
      timers."illegal_crime_mc_update_blacklist" = {
        wantedBy = [ "timers.target" ];
        timerConfig = {
          OnCalendar = "hourly";
          Persistent = true;
          Unit = "illegal_crime_mc_update_blacklist.service";
        };
      };
    };
  };
}
