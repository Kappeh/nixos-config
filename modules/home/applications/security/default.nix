{ config, lib, ... }: {
  imports = [
    ./keepass_diff.nix
    ./keepassxc.nix
  ];

  options.myModules.applications.security.enable = lib.mkEnableOption "Enable security applications";

  config.myModules.applications.security = {
    keepass_diff.enable = lib.mkDefault config.myModules.applications.security.enable;
    keepassxc.enable = lib.mkDefault config.myModules.applications.security.enable;
  };
}
