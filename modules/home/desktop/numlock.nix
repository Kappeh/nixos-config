{ config, lib, ... }: {
  config = lib.mkIf config.kappeh.desktop.enable {
    xsession.numlock.enable = true;
    systemd.user.services.numlockx.Install.WantedBy = lib.mkForce [];
  };
}

