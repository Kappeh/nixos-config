{ config, lib, osConfig, ... }: {
  options.myModules.core.gnupg.enable = lib.mkEnableOption "Enable gnupg";

  config = lib.mkIf config.myModules.core.gnupg.enable {
    home.persistence = lib.mkIf osConfig.myModules.core.impermanence.enable {
      "/persist/home/${config.home.username}".directories = [ ".gnupg" ];
    };
  };
}
