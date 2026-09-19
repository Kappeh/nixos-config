{ config, lib, ... }: {
  options.kappeh.shell.zoxide.enable = lib.mkEnableOption "Enable zoxide";

  config = lib.mkIf config.kappeh.shell.zoxide.enable {
    home.persistence."/persist".directories = [ ".local/share/zoxide" ];

    programs.zoxide = {
      enable = true;

      enableBashIntegration = true;
      enableFishIntegration = true;
      enableNushellIntegration = true;
      enableZshIntegration = true;
    };
  };
}

