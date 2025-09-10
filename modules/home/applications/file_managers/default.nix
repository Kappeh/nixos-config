{ config, lib, ... }: {
  imports = [
    ./pcmanfm.nix
  ];

  options.myModules.applications.file_managers.enable = lib.mkEnableOption "Enable file managers";

  config = {
    myModules.applications.file_managers = {
      pcmanfm.enable = lib.mkDefault config.myModules.applications.file_managers.enable;
    };

    # TODO find better way to do this
    xdg.mimeApps.defaultApplications."inode/directory" = [ "pcmanfm.desktop" ];
  };
}
