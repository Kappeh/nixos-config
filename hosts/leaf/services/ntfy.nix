{ inputs, pkgs, ... }: {
  config.users = {
    users.ntfy_server = {
      uid = 2002;
      group = "ntfy_server";
      isNormalUser = false;
      isSystemUser = true;
      useDefaultShell = false;
      shell = pkgs.shadow;
    };
    groups.ntfy_server = {
      name = "ntfy_server";
      gid = 2002;
      members = [
        "ntfy_server"
        "kieran"
      ];
    };
  };
}

