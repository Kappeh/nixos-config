{ pkgs, ... }: {
  config = {
    networking.firewall.allowedTCPPorts = [ 8008 ];

    users = {
      users.synapse = {
        uid = 2016;
        group = "synapse";
        isNormalUser = false;
        isSystemUser = true;
        useDefaultShell = false;
        shell = pkgs.shadow;
      };
      groups.synapse = {
        name = "synapse";
        gid = 2016;
        members = [
          "synapse"
          "kieran"
        ];
      };
    };
  };
}
