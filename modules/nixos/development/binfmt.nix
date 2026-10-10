{ config, lib, ... }: {
  options.kappeh.development.binfmt.enable = lib.mkEnableOption "Enable binfmt";

  config = lib.mkIf config.kappeh.development.binfmt.enable {
    # Used for building ARM NixOS images
    boot.binfmt.emulatedSystems = [ "aarch64-linux" ];
  };
}
