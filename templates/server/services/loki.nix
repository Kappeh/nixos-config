{ pkgs, ... }: {
  config.users = {
    users.loki = {
      uid = 2003;
      group = "loki";
      isNormalUser = false;
      isSystemUser = true;
      useDefaultShell = false;
      shell = pkgs.shadow;
    };
    groups.loki = {
      name = "loki";
      gid = 2003;
      members = [
        "loki"
        "kieran"
      ];
    };
  };
}
