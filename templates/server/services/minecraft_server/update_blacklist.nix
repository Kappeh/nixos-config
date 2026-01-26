{ config, pkgs, ... }: let
  script = pkgs.writeScriptBin "minecraft_server_update_blacklist" (builtins.readFile ./update_blacklist.sh);
in {
  config = {
    environment.systemPackages = [
      pkgs.ipset
      pkgs.whois
      # script
    ];
    systemd = {
      services."minecraft_server_update_blacklist" = {
        serviceConfig = {
          Type = "oneshot";
          User = "root";
          ExecStart = "${script}/bin/minecraft_server_update_blacklist";
          Environment = "PATH=/run/current-system/sw/bin";
        };
      };
      timers."minecraft_server_update_blacklist" = {
        wantedBy = [ "timers.target" ];
        timerConfig = {
          OnCalendar = "hourly";
          Persistent = true;
          Unit = "minecraft_server_update_blacklist.service";
        };
      };
    };
  };
}
