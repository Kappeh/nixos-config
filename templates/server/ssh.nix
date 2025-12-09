{ config, lib, ... }: {
  config.services.openssh = {
    enable = true;

    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
    };

    hostKeys = [
      {
        comment = "host_key_25519";
        path = "/persist/system/etc/ssh/host_key_ed25519";
        type = "ed25519";
      }
    ];
  };
}
