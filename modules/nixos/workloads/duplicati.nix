{ config, lib, pkgs, ... }: {
  options.kappeh.workloads.duplicati.enable = lib.mkEnableOption "Enable duplicati workload";

  config = with config.kappeh.workloads; {
    users.users.duplicati = {
      name = "duplicati";
      uid = 2011;
      group = "duplicati";
      isNormalUser = false;
      isSystemUser = true;
      useDefaultShell = false;
      shell = pkgs.shadow;
    };

    users.groups.duplicati = {
      name = "duplicati";
      gid = 2011;
      members = [
        "duplicati"
        "kieran"
      ];
    };

    kappeh.storage.shares.duplicati_backup_1.enable = lib.mkIf duplicati.enable true;

    networking.firewall.allowedTCPPorts = lib.mkIf duplicati.enable [ 8200 ];
  };
}

