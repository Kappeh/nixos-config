{ config, lib, ... }: {
  imports = [
    ./alvr.nix
    ./gamemode.nix
    ./steam.nix
  ];

  options.kappeh.gaming = {
    enable = lib.mkEnableOption "Enable gaming capability";

    prismlauncher.enable = lib.mkEnableOption "Enable Prism Launcher";
    protontricks.enable = lib.mkEnableOption "Enable protontricks";
    protonup_qt.enable = lib.mkEnableOption "Enable ProtonUp-Qt";
    r2modman.enable = lib.mkEnableOption "Enable R2ModMan";
    sidequest.enable = lib.mkEnableOption "Enable SideQuest";
    supertuxkart.enable = lib.mkEnableOption "Enable SuperTuxKart";
    tetrio.enable = lib.mkEnableOption "Enable Tetr.io";
  };

  config.kappeh.gaming = with config.kappeh; {
    alvr.enable = lib.mkDefault gaming.enable;
    gamemode.enable = lib.mkDefault gaming.enable;
    steam.enable = lib.mkDefault gaming.enable;

    prismlauncher.enable = lib.mkDefault gaming.enable;
    protonup_qt.enable = lib.mkDefault gaming.enable;
    protontricks.enable = lib.mkDefault gaming.enable;
    r2modman.enable = lib.mkDefault gaming.enable;
    sidequest.enable = lib.mkDefault gaming.enable;
    supertuxkart.enable = lib.mkDefault gaming.enable;
    tetrio.enable = lib.mkDefault gaming.enable;
  };
}

