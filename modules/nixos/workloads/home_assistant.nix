{ config, lib, pkgs, ... }: {
  options.kappeh.workloads.home_assistant.enable = lib.mkEnableOption "Enable home_assistant workload";

  config = with config.kappeh.workloads; {
    users.users.home_assistant = {
      name = "home_assistant";
      uid = 2019;
      group = "home_assistant";
      isNormalUser = false;
      isSystemUser = true;
      useDefaultShell = false;
      shell = pkgs.shadow;
    };

    users.groups.home_assistant = {
      name = "home_assistant";
      gid = 2019;
      members = [
        "home_assistant"
        "kieran"
      ];
    };

    kappeh.storage.shares.home_assistant_1.enable = lib.mkIf home_assistant.enable true;

    networking.firewall.allowedTCPPorts = lib.mkIf home_assistant.enable [ 8123 ];
  };
}

