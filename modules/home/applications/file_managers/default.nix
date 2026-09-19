{ config, lib, ... }: {
  imports = [
    ./lf.nix
    ./pcmanfm.nix
    ./yazi.nix
  ];

  options.kappeh.applications.file_managers.enable = lib.mkEnableOption "Enable file managers";

  config = {
    kappeh.applications.file_managers = with config.kappeh.applications; {
      lf.enable = lib.mkDefault file_managers.enable;
      pcmanfm.enable = lib.mkDefault file_managers.enable;
      yazi.enable = lib.mkDefault file_managers.enable;
    };

    # TODO find better way to do this
    xdg.mimeApps.defaultApplications."inode/directory" = [ "pcmanfm.desktop" ];
  };
}

