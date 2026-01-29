{ pkgs, ... }: {
  config.users = {
    users.cipher = {
      uid = 2017;
      group = "cipher";
      isNormalUser = false;
      isSystemUser = true;
      useDefaultShell = false;
      shell = pkgs.shadow;
    };
    groups.cipher = {
      name = "cipher";
      gid = 2017;
      members = [
        "cipher"
        "kieran"
      ];
    };
  };
}
