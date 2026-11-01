{ config, lib, ... }: {
  options.kappeh.security.keepassxc.enable = lib.mkEnableOption "Enable KeePassXC";

  config = lib.mkIf config.kappeh.security.keepassxc.enable {
    home.persistence."/persist".directories = [
      ".cache/keepassxc/"
    ];

    programs.keepassxc = {
      enable = true;
      autostart = false;
      settings = {
        General.ConfigVersion = 2;
        Browser.Enabled = true;
        GUI = {
          ApplicationTheme = "classic";
          ColorPasswords = true;
          HidePasswords = true;
        };
        PasswordGenerator.Length = 64;
        SSHAgent.Enabled = true;
        Security.LockDatabaseIdle = false;
      };
    };
  };
}
