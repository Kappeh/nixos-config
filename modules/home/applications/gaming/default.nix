{ config, lib, ... }: {
  imports = [
    ./prismlauncher.nix
    ./protonup_qt.nix
    ./r2modman.nix
    ./sidequest.nix
    ./steam.nix
  ];

  options.myModules.applications.gaming.enable = lib.mkEnableOption "Enable gaming";

  config = lib.mkIf config.myModules.applications.gaming.enable {
    myModules.applications.gaming = {
      prismlauncher.enable = lib.mkDefault true;
      protonup_qt.enable = lib.mkDefault true;
      r2modman.enable = lib.mkDefault true;
      sidequest.enable = lib.mkDefault true;
      steam.enable = lib.mkDefault true;
    };
  };
}
