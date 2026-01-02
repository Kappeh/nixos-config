{ pkgs, ... }: {
  config.users = {
    users.duplicati = {
      uid = 2011;
      group = "duplicati";
      isNormalUser = false;
      isSystemUser = true;
      useDefaultShell = false;
      shell = pkgs.shadow;
    };
    groups.duplicati = {
      name = "duplicati";
      gid = 2011;
      members = [
        "duplicati"
        "kieran"
      ];
    };
  };
}
