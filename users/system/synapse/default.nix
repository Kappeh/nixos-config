{ config, lib, ... }: {
  options.myModules.users.system.synapse.enable = lib.mkEnableOption "Enable synapse user and group";

  config.users = lib.mkIf config.myModules.users.system.synapse.enable {
    users.synapse = {
      uid = 503;
      group = "synapse";
      isNormalUser = false;
      isSystemUser = true;
      useDefaultShell = false;
      shell = null;
    };

    groups.synapse = {
      gid = 503;
      members = builtins.concatLists [
        [ "synapse" ]

        (lib.optional config.myModules.users.normal.kieran.enable "kieran")
      ];
    };
  };
}
