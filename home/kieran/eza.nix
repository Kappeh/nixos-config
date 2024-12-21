{ config, ... }: {
  config.programs.eza = {
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
