{ config, lib, ... }: {
  options.myModules.users.system.project_zomboid.enable = lib.mkEnableOption "Enable project_zomboid user and group";

  config.users = lib.mkIf config.myModules.users.system.project_zomboid.enable {
    users.project_zomboid = {
      uid = 400;
      group = "nogroup";
      isNormalUser = false;
      isSystemUser = true;
      useDefaultShell = false;
      shell = null;
      extraGroups = builtins.concatLists [
        # Grant access to shared files used by services
        (lib.lists.optional config.myModules.users.system.services.enable "services")
      ];
    };

    # groups.project_zomboid = {
    # };
  };
}
