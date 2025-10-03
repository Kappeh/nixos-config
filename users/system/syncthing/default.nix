{ config, lib, pkgs, ... }: {
  options.myModules.users.system.syncthing.enable = lib.mkEnableOption "Enable syncthing user and group";

  config.users = lib.mkIf config.myModules.users.system.syncthing.enable {
    users.syncthing = {
      uid = 501;
      group = "services";
      isNormalUser = false;
      isSystemUser = true;
      useDefaultShell = false;
      shell = pkgs.shadow;
    };

    groups.syncthing = {
      gid = 501;
      members = builtins.concatLists [
        (lib.optional config.myModules.users.normal.kieran.enable "kieran")
      ];
    };
  };
}
