{ config, lib, osConfig, ... }: {
  options.myModules.core.sops.enable = lib.mkEnableOption "Enable SOPS";

  config = {
    # Disable SOPS Home Manager module if NixOS module is disabled
    myModules = lib.mkIf (!osConfig.myModules.core.sops.enable) {
      core.sops.enable = lib.mkForce false;
    };

    home = lib.mkIf config.myModules.core.sops.enable {
      persistence = lib.mkIf osConfig.myModules.core.impermanence.enable {
        "/persist/home/${config.home.username}".files = [ ".config/sops/age/keys.txt" ];
      };
    };
  };
}
