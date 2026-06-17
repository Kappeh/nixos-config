{ config, lib, inputs, ... }: {
  options.myModules.applications.gaming.steam.enable = lib.mkEnableOption "Enable Steam";

  config = lib.mkIf config.myModules.applications.gaming.steam.enable {
    nixpkgs.overlays = [ inputs.millennium.overlays.default ];
    hardware.graphics.enable32Bit = true;
  };
}
