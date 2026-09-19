{ config, lib, pkgs, ... }: {
  options.kappeh.applications.file_managers.pcmanfm.enable = lib.mkEnableOption "Enable PCManFM";

  config.home = lib.mkIf config.kappeh.applications.file_managers.pcmanfm.enable {
    persistence."/persist".directories = [
      ".config/libfm"
      ".config/pcmanfm/default"
    ];

    packages = [ pkgs.pcmanfm ];
  };
}

