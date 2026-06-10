{ pkgs, ... }: {
  config.users = {
    users.jellyfin = {
      uid = 2007;
      group = "jellyfin";
      isNormalUser = false;
      isSystemUser = true;
      useDefaultShell = false;
      shell = pkgs.shadow;
    };
    groups.jellyfin = {
      name = "jellyfin";
      gid = 2007;
      members = [
        "jellyfin"
        "kieran"
      ];
    };
  };
}
