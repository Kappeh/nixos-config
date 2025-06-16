{ config, pkgs, ... }: let
  script = pkgs.writeScriptBin "update_rota" (builtins.readFile ./update_rota.sh);
in {
  config = {
    # environment.systemPackages = [ script ];
    systemd = {
      services."update_rota" = {
        serviceConfig = {
          Type = "oneshot";
          User = "root";
          ExecStart = "${script}/bin/update_rota";
          Environment = "PATH=/run/current-system/sw/bin";
        };
      };
      timers."update_rota" = {
        wantedBy = [ "timers.target" ];
        timerConfig = {
          OnCalendar = "hourly";
          Persistent = true;
          Unit = "update_rota.service";
        };
      };
    };
  };
}
