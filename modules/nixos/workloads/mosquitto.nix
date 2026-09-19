{ config, lib, pkgs, ... }: {
  options.kappeh.workloads.mosquitto.enable = lib.mkEnableOption "Enable mosquitto workload";

  config = with config.kappeh.workloads; {
    users.users.mosquitto = {
      name = "misquitto";
      uid = 2020;
      group = "mosquitto";
      isNormalUser = false;
      isSystemUser = true;
      useDefaultShell = false;
      shell = pkgs.shadow;
    };

    users.groups.mosquitto = {
      name = "mosquitto";
      gid = 2020;
      members = [
        "mosquitto"
        "kieran"
      ];
    };

    networking.firewall.allowedTCPPorts = lib.mkIf mosquitto.enable [
      1883 # MQTT (insecure/plaintext)
      9001 # MQTT over WebSocket
    ];
  };
}

