{ pkgs, ... }: {
  config.users = {
    users.synapse = {
      uid = 2016;
      group = "synapse";
      isNormalUser = false;
      isSystemUser = true;
      useDefaultShell = false;
      shell = pkgs.shadow;
    };
    groups.synapse = {
      name = "synapse";
      gid = 2016;
      members = [
        "synapse"
        "kieran"
      ];
    };
  };
}
