{ config, lib, osConfig, ... }: {
  options.myModules.tools.zoxide.enable = lib.mkEnableOption "Enable zoxide";

  config = lib.mkIf config.myModules.tools.zoxide.enable {
    programs.zoxide = {
      enable = true;

      enableBashIntegration = true;
      enableFishIntegration = true;
      enableNushellIntegration = true;
      enableZshIntegration = true;
    };

    home.persistence = lib.mkIf osConfig.myModules.core.impermanence.enable {
      "/persist/home/${config.home.username}".directories = [ ".local/share/zoxide" ];
    };
  };
}
