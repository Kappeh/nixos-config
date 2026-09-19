{ pkgs, ... }: {
  config = {
    users.users.namecheap_ddns = {
      name = "namecheap_ddns";
      uid = 2013;
      group = "namecheap_ddns";
      isNormalUser = false;
      isSystemUser = true;
      useDefaultShell = false;
      shell = pkgs.shadow;
    };

    users.groups.namecheap_ddns = {
      name = "namecheap_ddns";
      gid = 2013;
      members = [
        "namecheap_ddns"
        "kieran"
      ];
    };
  };
}

