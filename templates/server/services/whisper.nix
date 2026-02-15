{ pkgs, ... }: {
  config = {
    networking.firewall.allowedTCPPorts = [ 10300 ];

    users = {
      users.whisper = {
        uid = 2022;
        group = "whisper";
        isNormalUser = false;
        isSystemUser = true;
        useDefaultShell = false;
        shell = pkgs.shadow;
      };
      groups.whisper = {
        name = "whisper";
        gid = 2022;
        members = [
          "whisper"
          "kieran"
        ];
      };
    };
  };
}
