{ config, lib, ... }: {
  options.myModules.core.numlock.enable = lib.mkEnableOption "Enable numlock";

  config = lib.mkIf config.myModules.core.numlock.enable {
    xsession.numlock.enable = true;
    systemd.user.services.numlockx.Install.WantedBy = lib.mkForce [];
  };
}
