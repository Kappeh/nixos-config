{ pkgs, ... }: {
  config.users = {
    users.uptime_kuma = {
      uid = 2009;
      group = "uptime_kuma";
      extraGroups = [
        "docker"
      ];
      isNormalUser = false;
      isSystemUser = true;
      useDefaultShell = false;
      shell = pkgs.shadow;
    };
    groups.uptime_kuma = {
      name = "uptime_kuma";
      gid = 2009;
      members = [
        "uptime_kuma"
        "kieran"
      ];
    };
  };
}
