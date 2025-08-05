{ config, lib, ... }: {
  config = {
    sops = {
      defaultSopsFile = ../../sops/secrets.yaml;
      defaultSopsFormat = "yaml";
      age.keyFile = "/persist/system/root/.config/sops/age/keys.txt";
      secrets."users/kieran/hashedPassword".neededForUsers = true;
    };

    environment = lib.mkIf config.impermanence.enable {
      persistence."/persist/system".files = [ "/root/.config/sops/age/keys.txt" ];
    };
  };
}
