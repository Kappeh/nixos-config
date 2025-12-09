{ pkgs, ... }: {
  config.users = {
    users.grafana = {
      uid = 2005;
      group = "grafana";
      isNormalUser = false;
      isSystemUser = true;
      useDefaultShell = false;
      shell = pkgs.shadow;
    };
    groups.grafana = {
      name = "grafana";
      gid = 2005;
      members = [
        "grafana"
        "kieran"
      ];
    };
  };
}
