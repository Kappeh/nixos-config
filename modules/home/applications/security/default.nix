{ config, lib, ... }: {
  imports = [
    ./keepass_diff.nix
    ./keepassxc.nix
  ];

  options.myModules.applications.security.enable = lib.mkEnableOption "Enable security applications";

  config = lib.mkIf config.myModules.applications.security.enable {
    myModules.applications.security = {
      keepass_diff.enable = lib.mkDefault true;
      keepassxc.enable = lib.mkDefault true;
    };
  };
}
