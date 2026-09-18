{ config, lib, ... }: {
  config.systemd = lib.mkIf config.myModules.services.docker.minecraft_server.enable {
    services."minecraft_server_time_set_day" = {
      serviceConfig = {
        Type = "oneshot";
        User = "root";
        WorkingDirectory = "/services/minecraft_server";
        ExecStart = "/services/minecraft_server/scripts/time_set_day.sh";
        Environment = "PATH=/run/current-system/sw/bin";
      };
    };
    timers."minecraft_server_time_set_day" = {
      wantedBy = [ "timers.target" ];
      timerConfig = {
        OnCalendar = "*:0/10";
        Persistent = true;
        Unit = "minecraft_server_time_set_day.service";
      };
    };
  };
}

