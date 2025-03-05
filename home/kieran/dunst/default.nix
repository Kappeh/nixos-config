{ config, lib, ... }: {
  config.systemd.user.services.dunst.Install.WantedBy = lib.mkForce [];

  config.services.dunst = {
    enable = true;

    configFile = ./dunstrc;
  };
}
