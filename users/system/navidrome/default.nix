{ config, lib, ... }: {
  options.myModules.users.system.navidrome.enable = lib.mkEnableOption "Enable navidrome user and group";

  config.users = lib.mkIf config.myModules.users.system.navidrome.enable {
    users.navidrome = {
      uid = 504;
      group = "navidrome";
      isNormalUser = false;
      isSystemUser = true;
      useDefaultShell = false;
      shell = null;
    };

    groups.navidrome = {
      gid = 504;
      members = builtins.concatLists [
        [ "navidrome" ]

        (lib.lists.optional config.myModules.users.normal.kieran.enable "kieran")
      ];
    };
  };
}
