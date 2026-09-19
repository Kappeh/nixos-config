{ config, lib, inputs, ... }: {
  options.kappeh.gaming.steam.enable = lib.mkEnableOption "Enable Steam";

  config = lib.mkIf config.kappeh.gaming.steam.enable {
    nixpkgs.overlays = [ inputs.millennium.overlays.default ];
    hardware.graphics.enable32Bit = true;
  };
}

