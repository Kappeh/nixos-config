{ pkgs, ... }: {
  config.users = {
    users.wireguard = {
      uid = 2024;
      group = "wireguard";
      isNormalUser = false;
      isSystemUser = true;
      useDefaultShell = false;
      shell = pkgs.shadow;
    };
    groups.wireguard = {
      name = "wireguard";
      gid = 2024;
      members = [
        "wireguard"
        "kieran"
      ];
    };
  };
}
