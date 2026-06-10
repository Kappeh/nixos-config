{ config, lib, ... }: {
  options.myModules.applications.security = {
    enable = lib.mkEnableOption "Enable all security applications by default";

    keepass_diff.enable = lib.mkEnableOption "Enable keepass-diff";
    keepassxc.enable = lib.mkEnableOption "Enable KeePassXC";
  };

  config.myModules.applications.security = {
    keepass_diff.enable = lib.mkDefault config.myModules.applications.security.enable;
    keepassxc.enable = lib.mkDefault config.myModules.applications.security.enable;
  };
}
