{ config, lib, ... }: {
  options.kappeh.applications.file_managers = {
    enable = lib.mkEnableOption "Enable all file managers by default";

    lf.enable = lib.mkEnableOption "Enable lf";
    pcmanfm.enable = lib.mkEnableOption "Enable PCManfm";
    yazi.enable = lib.mkEnableOption "Enable yazi";
  };

  config.kappeh.applications.file_managers = with config.kappeh.applications; {
    lf.enable = lib.mkDefault file_managers.enable;
    pcmanfm.enable = lib.mkDefault file_managers.enable;
    yazi.enable = lib.mkDefault file_managers.enable;
  };
}

