{ config, lib, ... }: {
  options.myModules.tools.thefuck.enable = lib.mkEnableOption "Enable thefuck";

  config = lib.mkIf config.myModules.tools.thefuck.enable {
    programs.thefuck = {
      enable = true;

      enableBashIntegration = true;
      enableFishIntegration = true;
      enableNushellIntegration = true;
      enableZshIntegration = true;
    };
  };
}
