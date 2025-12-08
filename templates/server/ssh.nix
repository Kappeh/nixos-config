{ config, lib, ... }: {
  config = {
    services.openssh = {
      enable = true;

      settings = {
        PermitRootLogin = "no";
        PasswordAuthentication = false;
        KbdInteractiveAuthentication = false;
      };

      hostKeys = [
        {
          comment = "leaf_host_key_ed25519";
          path = "/persist/system/etc/ssh/leaf_host_key_ed25519";
          type = "ed25519";
        }
      ];

      knownHosts."git.illegal-crime.org" = {
        hostNames = [ "[git.illegal-crime.org]:2222" ];
        publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILTrGImrwi6JAv2JSf5hVKU3SBh/PcA0+Zmwl4f2+3h3 gitea_host_key";
      };
    };
  };
}
