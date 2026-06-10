{ ... }: {
  config = {
    myModules.shares.duplicati_backup_1.enable = true;
    networking.firewall.allowedTCPPorts = [ 8200 ];
  };
}
