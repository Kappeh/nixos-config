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
          path = "/persist/etc/ssh/leaf_host_key_ed25519";
          type = "ed25519";
        }
      ];
    };
  };
}
