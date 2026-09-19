{ config, lib, ... }: {
  options.kappeh.workloads.misc.enable = lib.mkEnableOption "Enable misc workload";

  config = lib.mkIf config.kappeh.workloads.misc.enable {
    networking.firewall.allowedTCPPorts = [
      10000
      10001
      10002
      10003
      10004
      10005
      10006
      10007
      10008
    ];
  };
}

