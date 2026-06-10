{ pkgs, ... }: {
  config.users = {
    users.navidrome = {
      uid = 2012;
      group = "navidrome";
      isNormalUser = false;
      isSystemUser = true;
      useDefaultShell = false;
      shell = pkgs.shadow;
    };
    groups.navidrome = {
      name = "navidrome";
      gid = 2012;
      members = [
        "navidrome"
        "kieran"
      ];
    };
  };
}
