{ config, lib, ... }: {
  options.myModules.tools.zoxide.enable = lib.mkEnableOption "Enable zoxide";

  config = lib.mkIf config.myModules.tools.zoxide.enable {
    programs.zoxide = {
      enable = true;

      enableBashIntegration = true;
      enableFishIntegration = true;
      enableNushellIntegration = true;
      enableZshIntegration = true;
    };

    home.persistence."/persist".directories = [ ".local/share/zoxide" ];
  };
}
