{ config, lib, ... }: {
  options.kappeh.security.gnupg.enable = lib.mkEnableOption "Enable gnupg";

  config = lib.mkIf config.kappeh.security.gnupg.enable {
    home.persistence."/persist".directories = [ ".gnupg" ];
  };
}

