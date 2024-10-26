{ config, ... }: {
  config.sops = {
    defaultSopsFile = ../../sops/secrets.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = /persist/system/root/.config/sops/age/keys.txt;
    secrets."users/kieran/hashedPassword".neededForUsers = true;
  };
}
