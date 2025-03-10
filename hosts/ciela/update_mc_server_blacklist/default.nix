{ pkgs, ... }:
let
  update_mc_server_blacklist_script = pkgs.writeScriptBin "update_mc_server_blacklist" (builtins.readFile ./update_mc_server_blacklist.sh);
in {
  environment.systemPackages = [
    pkgs.ipset
    pkgs.whois
    update_mc_server_blacklist_script
  ];

  systemd = {
    timers = {
      "update_mc_server_blacklist" = {
        wantedBy = [ "timers.target" ];
        timerConfig = {
          OnCalendar = "hourly";
          Persistent = true;
          Unit = "update_mc_server_blacklist.service";
        };
      };
    };
    services = {
      "update_mc_server_blacklist" = {
        wantedBy = [ "multi-user.target" ]; # Ensures the service runs on boot
        serviceConfig = {
          Type = "oneshot";
          User = "root";
          ExecStart = "${update_mc_server_blacklist_script}/bin/update_mc_server_blacklist";
          Environment = "PATH=/run/current-system/sw/bin";
        };
      };
    };
  };
}
