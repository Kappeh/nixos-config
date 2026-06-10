{ pkgs, ... }: {
  config.users = {
    users.mosquitto = {
      uid = 2020;
      group = "mosquitto";
      isNormalUser = false;
      isSystemUser = true;
      useDefaultShell = false;
      shell = pkgs.shadow;
    };
    groups.mosquitto = {
      name = "mosquitto";
      gid = 2020;
      members = [
        "mosquitto"
        "kieran"
      ];
    };
  };
}
