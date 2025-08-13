{ config, lib, ... }: {
  options.myModules.tools.eza.enable = lib.mkEnableOption "Enable eza";

  config = lib.mkIf config.myModules.tools.eza.enable {
    programs.eza = {
      enable = true;

      enableBashIntegration = true;
      enableFishIntegration = true;
      enableIonIntegration = false;
      enableNushellIntegration = true;
      enableZshIntegration = true;

      git = true;
      icons = "auto";
    };
  };
}
