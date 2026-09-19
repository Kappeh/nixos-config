{ pkgs, ... }: {
  config = {
    users.users.grafana = {
      name = "grafana";
      uid = 2005;
      group = "grafana";
      isNormalUser = false;
      isSystemUser = true;
      useDefaultShell = false;
      shell = pkgs.shadow;
    };

    users.groups.grafana = {
      name = "grafana";
      gid = 2005;
      members = [
        "grafana"
        "kieran"
      ];
    };
  };
}
