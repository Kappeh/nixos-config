{ config, lib, pkgs, ... }: {
  options.myModules.applications.file_managers.pcmanfm.enable = lib.mkEnableOption "Enable PCManFM";

  config = lib.mkIf config.myModules.applications.file_managers.pcmanfm.enable {
    home = {
      packages = [ pkgs.pcmanfm ];

      persistence."/persist/home/${config.home.username}".directories = [
        ".config/libfm"
        ".config/pcmanfm/default"
      ];
    };
  };
}
