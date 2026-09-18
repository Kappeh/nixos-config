{ config, lib, ... }: {
  options.myModules.services.docker.duplicati.enable = lib.mkEnableOption "Enable duplicati service";

  config = lib.mkIf config.myModules.services.docker.duplicati.enable {
    myModules.shares.duplicati_backup_1.enable = true;
    networking.firewall.allowedTCPPorts = [ 8200 ];
  };
}
