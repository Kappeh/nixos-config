{ config, lib, pkgs, ... }: {
  options.myModules.applications.editors.godot.enable = lib.mkEnableOption "Enable Godot";

  config = lib.mkIf config.myModules.applications.editors.godot.enable {
    home = {
      packages = [ pkgs.godot ];

      persistence."/persist/home/${config.home.username}".directories = [
        ".config/godot"
        ".local/share/godot"
      ];
    };
  };
}
