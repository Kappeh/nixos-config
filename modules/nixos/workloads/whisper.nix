{ config, lib, pkgs, ... }: {
  options.kappeh.workloads.whisper.enable = lib.mkEnableOption "Enable whisper workload";

  config = with config.kappeh.workloads; {
    users.users.whisper = {
      name = "whisper";
      uid = 2022;
      group = "whisper";
      isNormalUser = false;
      isSystemUser = true;
      useDefaultShell = false;
      shell = pkgs.shadow;
    };

    users.groups.whisper = {
      name = "whisper";
      gid = 2022;
      members = [
        "whisper"
        "kieran"
      ];
    };

    networking.firewall.allowedTCPPorts = lib.mkIf whisper.enable [ 10300 ];
  };
}

