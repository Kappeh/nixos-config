{ config, lib, ... }: {
  options.myModules.applications.file_managers = {
    enable = lib.mkEnableOption "Enable all file managers by default";

    pcmanfm.enable = lib.mkEnableOption "Enable PCManfm";
  };

  config.myModules.applications.file_managers = {
    pcmanfm.enable = lib.mkDefault config.myModules.applications.file_managers.enable;
  };
}
