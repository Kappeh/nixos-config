{ pkgs, ... }: {
  config = {
    networking.firewall.allowedTCPPorts = [ 8384 ];

    users = {
      users.syncthing = {
        uid = 2010;
        group = "syncthing";
        isNormalUser = false;
        isSystemUser = true;
        useDefaultShell = false;
        shell = pkgs.shadow;
      };
      groups.syncthing = {
        name = "syncthing";
        gid = 2010;
        members = [
          "syncthing"
          "kieran"
        ];
      };
    };
  };
}
