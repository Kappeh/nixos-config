{ config, lib, pkgs, ... }: {
  options.myModules.applications.gaming.prismlauncher.enable = lib.mkEnableOption "Enable Prism Launcher";

  config = lib.mkIf config.myModules.applications.gaming.prismlauncher.enable {
    home = {
      packages = [ pkgs.prismlauncher ];

      persistence."/persist".directories = [ ".local/share/PrismLauncher" ];
    };
  };
}
