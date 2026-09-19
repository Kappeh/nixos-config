{ config, lib, ... }: {
  options.kappeh.security.ssh.enable = lib.mkEnableOption "Enable SSH";

  config = lib.mkIf config.kappeh.security.ssh.enable {
    home.persistence."/persist".directories = [ ".ssh" ];
  };
}

