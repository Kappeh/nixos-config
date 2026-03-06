{ config, lib, pkgs, ... }: {
  options.myModules.tools.nix_index.enable = lib.mkEnableOption "Enable nix-index";

  config = lib.mkIf config.myModules.tools.nix_index.enable {
    home.packages = [ pkgs.nix-index ];
    home.persistence."/persist/home/${config.home.username}".directories = [
      ".cache/nix-index"
    ];
  };
}
