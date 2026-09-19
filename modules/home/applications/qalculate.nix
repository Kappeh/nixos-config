{ config, lib, pkgs, ... }: {
  options.kappeh.applications.qalculate.enable = lib.mkEnableOption "Enable Qalculate";

  config.home = lib.mkIf config.kappeh.applications.qalculate.enable {
    persistence."/persist".directories = [
      ".config/qalculate"
      ".local/share/qalculate"
    ];

    packages = [ pkgs.qalculate-qt ];
  };
}

