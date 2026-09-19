{ config, lib, ... }: {
  imports = [
    ./prismlauncher.nix
    ./protontricks.nix
    ./protonup_qt.nix
    ./r2modman.nix
    ./sidequest.nix
    ./steam.nix
    ./supertuxkart.nix
    ./tetrio.nix
  ];

  options.kappeh.gaming.enable = lib.mkEnableOption "Enable gaming capability";

  config.kappeh.gaming = with config.kappeh; {
    prismlauncher.enable = lib.mkDefault gaming.enable;
    protontricks.enable = lib.mkDefault gaming.enable;
    protonup_qt.enable = lib.mkDefault gaming.enable;
    r2modman.enable = lib.mkDefault gaming.enable;
    sidequest.enable = lib.mkDefault gaming.enable;
    steam.enable = lib.mkDefault gaming.enable;
    supertuxkart.enable = lib.mkDefault gaming.enable;
    tetrio.enable = lib.mkDefault gaming.enable;
  };
}

