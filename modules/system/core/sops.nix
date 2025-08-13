{ config, lib, ... }: {
  options.myModules.core.sops.enable = lib.mkEnableOption "Enable SOPS";

  config = lib.mkIf config.myModules.core.sops.enable {
    sops = {
      defaultSopsFile = ../../../sops/secrets.yaml;
      defaultSopsFormat = "yaml";
      age.keyFile = "/persist/system/root/.config/sops/age/keys.txt";
      secrets."users/kieran/hashedPassword".neededForUsers = true;
    };

    environment = lib.mkIf config.myModules.core.impermanence.enable {
      persistence."/persist/system".files = [ "/root/.config/sops/age/keys.txt" ];
    };
  };
}
