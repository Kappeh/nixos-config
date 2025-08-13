{ config, lib, osConfig, pkgs, ... }: {
  options.myModules.applications.gaming.prismlauncher.enable = lib.mkEnableOption "Enable Prism Launcher";

  config = lib.mkIf config.myModules.applications.gaming.prismlauncher.enable {
    home = {
      packages = [ pkgs.prismlauncher ];

      persistence = lib.mkIf osConfig.myModules.core.impermanence.enable {
        "/storage/home/${config.home.username}".directories = [ ".local/share/PrismLauncher" ];
      };
    };
  };
}
