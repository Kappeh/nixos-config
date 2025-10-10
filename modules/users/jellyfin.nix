{ config, lib, pkgs, ... }: {
  options.myModules.users.system.jellyfin.enable = lib.mkEnableOption "Enable jellyfin user and group";

  config.users = lib.mkIf config.myModules.users.system.jellyfin.enable {
    users.jellyfin = {
      uid = 1002;
      group = "nogroup";
      isNormalUser = false;
      isSystemUser = true;
      useDefaultShell = false;
      shell = pkgs.shadow;
      extraGroups = builtins.concatLists [
        [
          "render"    # Allow use of render devices
          "video"     # Allow use of video devices
        ]

        # Grant access to shared files used by services
        (lib.optional config.myModules.users.system.services.enable "services")
      ];
    };

    # groups.jellyfin = {
    # };
  };
}
