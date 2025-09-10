{ config, lib, ... }: {
  imports = [
    ./prismlauncher.nix
    ./protonup_qt.nix
    ./r2modman.nix
    ./sidequest.nix
    ./steam.nix
  ];

  options.myModules.applications.gaming.enable = lib.mkEnableOption "Enable gaming";

  config.myModules.applications.gaming = {
    prismlauncher.enable = lib.mkDefault config.myModules.applications.gaming.enable;
    protonup_qt.enable = lib.mkDefault config.myModules.applications.gaming.enable;
    r2modman.enable = lib.mkDefault config.myModules.applications.gaming.enable;
    sidequest.enable = lib.mkDefault config.myModules.applications.gaming.enable;
    steam.enable = lib.mkDefault config.myModules.applications.gaming.enable;
  };
}
