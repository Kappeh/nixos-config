{ inputs, ... }: {
  imports = [
    inputs.sops-nix.nixosModules.sops
  ];

  config = {
    sops = {
      defaultSopsFile = ../../../secrets/secrets.yaml;
      defaultSopsFormat = "yaml";
      age.keyFile = "/persist/system/root/.config/sops/age/keys.txt";
      secrets."users/kieran/hashedPassword".neededForUsers = true;
    };

    environment.persistence."/persist/system".files = [ "/root/.config/sops/age/keys.txt" ];
  };
}

