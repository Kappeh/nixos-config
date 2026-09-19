{ config, lib, ... }: {
  options.kappeh.shell.eza.enable = lib.mkEnableOption "Enable eza";

  config.programs.eza = lib.mkIf config.kappeh.shell.eza.enable {
    enable = true;

    enableBashIntegration = true;
    enableFishIntegration = true;
    enableIonIntegration = false;
    enableNushellIntegration = true;
    enableZshIntegration = true;

    git = true;
    icons = "auto";
  };
}

