{ config, lib, pkgs, ... }: {
  options.kappeh.gaming.supertuxkart.enable = lib.mkEnableOption "Enable Super Tux Kart";

  config.home = lib.mkIf config.kappeh.gaming.supertuxkart.enable {
    persistence."/persist".directories = [
      ".cache/supertuxkart"
      ".config/supertuxkart"
      ".local/share/supertuxkart"
    ];

    packages = [ pkgs.supertuxkart ];
  };
}

