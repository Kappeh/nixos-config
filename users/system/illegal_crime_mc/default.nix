{ config, lib, pkgs, ... }: {
  options.myModules.users.system.illegal_crime_mc.enable = lib.mkEnableOption "Enable illegal_crime_mc user and group";

  config.users = lib.mkIf config.myModules.users.system.illegal_crime_mc.enable {
    users.illegal_crime_mc = {
      uid = 500;
      group = "illegal_crime_mc";
      isNormalUser = false;
      isSystemUser = true;
      useDefaultShell = false;
      shell = pkgs.shadow;
    };

    groups.illegal_crime_mc = {
      gid = 500;
      members = builtins.concatLists [
        [ "illegal_crime_mc" ]

        (lib.optional config.myModules.users.normal.kieran.enable "kieran")
      ];
    };
  };
}
