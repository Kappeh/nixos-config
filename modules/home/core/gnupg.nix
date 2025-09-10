{ config, lib, ... }: {
  options.myModules.core.gnupg.enable = lib.mkEnableOption "Enable gnupg";

  config = lib.mkIf config.myModules.core.gnupg.enable {
    home.persistence."/persist/home/${config.home.username}".directories = [ ".gnupg" ];
  };
}
