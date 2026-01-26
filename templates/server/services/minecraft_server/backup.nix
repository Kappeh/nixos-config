{ config, pkgs, ... }: {
  config.systemd = {
    services."minecraft_server_backup" = {
      serviceConfig = {
        Type = "oneshot";
        User = "root";
        WorkingDirectory = "/services/minecraft_server";
        ExecStart = "/services/minecraft_server/scripts/backup.sh";
        Environment = "PATH=/run/current-system/sw/bin";
      };
    };
    timers."minecraft_server_backup" = {
      wantedBy = [ "timers.target" ];
      timerConfig = {
        OnCalendar = "hourly";
        Persistent = true;
        Unit = "minecraft_server_backup.service";
      };
    };
  };
}
