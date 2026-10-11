{ config, lib, ... }: {
  options.kappeh.gaming.sidequest.enable = lib.mkEnableOption "Enable SideQuest";

  config = lib.mkIf config.kappeh.gaming.sidequest.enable {
    nixpkgs.config.permittedInsecurePackages = [
      "sidequest-0.10.42"
    ];
  };
}
