{ config, lib, pkgs, ... }: {
  options.myModules.applications.gaming.prismlauncher.enable = lib.mkEnableOption "Enable Prism Launcher";

  config = lib.mkIf config.myModules.applications.gaming.prismlauncher.enable {
    home = {
      packages = [ pkgs.prismlauncher ];

      persistence."/storage/home/${config.home.username}".directories = [ ".local/share/PrismLauncher" ];
    };
  };
}
