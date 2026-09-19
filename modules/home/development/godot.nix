{ config, lib, pkgs, ... }: {
  options.kappeh.development.godot.enable = lib.mkEnableOption "Enable Godot";

  config.home = lib.mkIf config.kappeh.development.godot.enable {
    persistence."/persist".directories = [
      ".config/godot"
      ".local/share/godot"
    ];

    packages = [ pkgs.godot ];
  };
}
