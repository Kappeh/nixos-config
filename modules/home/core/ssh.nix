{ config, lib, ... }: {
  options.myModules.core.ssh.enable = lib.mkEnableOption "Enable SSH";

  config = lib.mkIf config.myModules.core.ssh.enable {
    home.persistence."/persist/home/${config.home.username}".directories = [ ".ssh" ];
  };
}
