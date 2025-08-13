{ config, lib, ... }: {
  options.myModules.users.system.duplicati.enable = lib.mkEnableOption "Enable duplicati user and group";

  config.users = lib.mkIf config.myModules.users.system.duplicati.enable {
    users.duplicati = {
      uid = 502;
      group = "services";
      isNormalUser = false;
      isSystemUser = true;
      useDefaultShell = false;
      shell = null;
    };

    groups.duplicati = {
      gid = 502;
      members = builtins.concatLists [
        (lib.lists.optional config.myModules.users.normal.kieran.enable "kieran")
      ];
    };
  };
}
