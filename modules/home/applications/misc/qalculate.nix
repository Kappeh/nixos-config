{ config, lib, pkgs, ... }: {
  options.myModules.applications.misc.qalculate.enable = lib.mkEnableOption "Enable Qalculate";

  config.home = lib.mkIf config.myModules.applications.misc.qalculate.enable {
    packages = [ pkgs.qalculate-qt ];

    persistence."/persist".directories = [
      ".config/qalculate"
      ".local/share/qalculate"
    ];
  };
}
