{ config, pkgs, ... }: {
  config.home = {
    packages = [ pkgs.prismlauncher ];

    persistence."/storage/home/kieran".directories = [ ".local/share/PrismLauncher" ];
  };
}
