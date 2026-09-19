{ config, lib, pkgs, ... }: {
  options.kappeh.development.nix_index.enable = lib.mkEnableOption "Enable nix-index";

  config.home = lib.mkIf config.kappeh.development.nix_index.enable {
    persistence."/persist".directories = [
      ".cache/nix-index"
    ];

    packages = [ pkgs.nix-index ];
  };
}

