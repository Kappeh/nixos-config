{ config, lib, ... }: {
  imports = [
    ./alvr.nix
    ./gamemode.nix
    ./steam.nix
  ];

  options.myModules.applications.gaming = {
    enable = lib.mkEnableOption "Enable all gaming applications by default";

    prismlauncher.enable = lib.mkEnableOption "Enable Prism Launcher";
    protonup_qt.enable = lib.mkEnableOption "Enable ProtonUp-Qt";
    r2modman.enable = lib.mkEnableOption "Enable R2ModMan";
    sidequest.enable = lib.mkEnableOption "Enable SideQuest";
    supertuxkart.enable = lib.mkEnableOption "Enable SuperTuxKart";
    tetrio.enable = lib.mkEnableOption "Enable Tetr.io";
  };

  config.myModules.applications.gaming = {
    alvr.enable = lib.mkDefault config.myModules.applications.gaming.enable;
    gamemode.enable = lib.mkDefault config.myModules.applications.gaming.enable;
    prismlauncher.enable = lib.mkDefault config.myModules.applications.gaming.enable;
    protonup_qt.enable = lib.mkDefault config.myModules.applications.gaming.enable;
    r2modman.enable = lib.mkDefault config.myModules.applications.gaming.enable;
    sidequest.enable = lib.mkDefault config.myModules.applications.gaming.enable;
    steam.enable = lib.mkDefault config.myModules.applications.gaming.enable;
    supertuxkart.enable = lib.mkDefault config.myModules.applications.gaming.enable;
    tetrio.enable = lib.mkDefault config.myModules.applications.gaming.enable;
  };
}
