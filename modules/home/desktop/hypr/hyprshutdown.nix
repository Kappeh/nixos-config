{ config, lib, pkgs, ... }: {
  config = lib.mkIf config.kappeh.desktop.enable {
    home.packages = [ pkgs.hyprshutdown ];

    programs.zsh.shellAliases = {
      poweroff = "hyprshutdown -t 'Shutting Down...' --post-cmd 'shutdown -P 0'";
      reboot = "hyprshutdown -t 'Rebooting...' --post-cmd 'reboot'";
    };
  };
}

