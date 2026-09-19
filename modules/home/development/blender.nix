{ config, lib, pkgs, ... }: {
  options.kappeh.development.blender.enable = lib.mkEnableOption "Enable Blender";

  config.home = lib.mkIf config.kappeh.development.blender.enable {
    persistence."/persist".directories = [
      ".cache/blender"
      ".config/blender"
    ];

    packages = [ pkgs.blender ];
  };
}

