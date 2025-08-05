{ config, ... }: {
  config = {
    programs.zoxide = {
      enable = true;

      enableBashIntegration = true;
      enableFishIntegration = true;
      enableNushellIntegration = true;
      enableZshIntegration = true;
    };

    home.persistence."/persist/home/kieran".directories = [ ".local/share/zoxide" ];
  };
}
