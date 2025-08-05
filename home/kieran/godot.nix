{ config, pkgs, ... }: {
  config.home = {
    packages = [ pkgs.godot ];

    persistence."/persist/home/kieran".directories = [
      ".config/godot"
      ".local/share/godot"
    ];
  };
}
