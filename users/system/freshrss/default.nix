{ config, lib, ... }: {
  options.myModules.users.system.freshrss.enable = lib.mkEnableOption "Enable FreshRSS user and group";

  config.users = lib.mkIf config.myModules.users.system.freshrss.enable {
    users.freshrss = {
      uid = 505;
      group = "freshrss";
      isNormalUser = false;
      isSystemUser = true;
      useDefaultShell = false;
      shell = null;
    };

    groups.freshrss = {
      gid = 505;
      members = builtins.concatLists [
        (lib.optional config.myModules.users.normal.kieran.enable "kieran")
      ];
    };
  };
}
