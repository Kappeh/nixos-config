{ config, lib, ... }: {
  options.myModules.users.system.services.enable = lib.mkEnableOption "Enable services group";

  config = lib.mkIf config.myModules.users.system.services.enable {
    users.groups.services = {
      gid = 1001;  # Group for shared files used by services
      members = builtins.concatLists [
        (lib.optional config.myModules.users.normal.kieran.enable "kieran")

        (lib.optional config.myModules.users.system.jellyfin.enable "jellyfin")
        (lib.optional config.myModules.users.system.project_zomboid.enable "project_zomboid")
        (lib.optional config.myModules.users.system.syncthing.enable "syncthing")
        (lib.optional config.myModules.users.system.duplicati.enable "duplicati")
      ];
    };
  };
}
