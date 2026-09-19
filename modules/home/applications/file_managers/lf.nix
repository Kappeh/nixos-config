{ config, lib, ... }: {
  options.kappeh.applications.file_managers.lf.enable = lib.mkEnableOption "Enable lf";

  config.programs.lf = lib.mkIf config.kappeh.applications.file_managers.lf.enable {
    enable = true;

    settings = {
      number = true;
      relativenumber = true;
      tabstop = 4;
    };
  };
}

