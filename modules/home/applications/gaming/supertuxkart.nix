{ config, lib, pkgs, ... }: {
  options.myModules.applications.gaming.supertuxkart.enable = lib.mkEnableOption "Enable Super Tux Kart";

  config.home = lib.mkIf config.myModules.applications.gaming.supertuxkart.enable {
    packages = [ pkgs.supertuxkart ];

    persistence."/persist".directories = [
      ".cache/supertuxkart"
      ".config/supertuxkart"
      ".local/share/supertuxkart"
    ];
  };
}
