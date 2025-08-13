{ config, lib, ... }: {
  imports = [
    ./pcmanfm.nix
  ];

  options.myModules.applications.file_managers.enable = lib.mkEnableOption "Enable file managers";

  config = lib.mkIf config.myModules.applications.file_managers.enable {
    myModules.applications.file_managers = {
      pcmanfm.enable = lib.mkDefault true;
    };

    # TODO find better way to do this
    xdg.mimeApps.defaultApplications."inode/directory" = [ "pcmanfm.desktop" ];
  };
}
