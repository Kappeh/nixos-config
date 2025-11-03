{ config, lib, pkgs, ... }: {
  options.myModules.applications.misc.qalculate.enable = lib.mkEnableOption "Enable Qalculate";

  config.home = lib.mkIf config.myModules.applications.misc.qalculate.enable {
    packages = [ pkgs.qalculate-qt ];

    persistence."/persist/home/${config.home.username}".directories = [
      ".config/qalculate"
      ".local/share/qalculate"
    ];
  };
}
