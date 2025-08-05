{ config, pkgs, ... }: {
  config.home = {
    packages = [ pkgs.blender ];

    persistence."/persist/home/kieran".directories = [
      ".cache/blender"
      ".config/blender"
    ];
  };
}
