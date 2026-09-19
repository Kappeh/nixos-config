{ config, lib, pkgs, ... }: {
  options.kappeh.gaming.prismlauncher.enable = lib.mkEnableOption "Enable Prism Launcher";

  config.home = lib.mkIf config.kappeh.gaming.prismlauncher.enable {
    persistence."/persist".directories = [ ".local/share/PrismLauncher" ];

    packages = [ pkgs.prismlauncher ];
  };
}

