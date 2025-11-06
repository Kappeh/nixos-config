{ config, lib, pkgs, ... }: {
  options.myModules.applications.gaming.supertuxkart.enable = lib.mkEnableOption "Enable Super Tux Kart";

  config.home = lib.mkIf config.myModules.applications.gaming.supertuxkart.enable {
    packages = [ pkgs.superTuxKart ];

    persistence."/persist/home/${config.home.username}".directories = [
      ".cache/supertuxkart"
      ".config/supertuxkart"
      ".local/share/supertuxkart"
    ];
  };
}
