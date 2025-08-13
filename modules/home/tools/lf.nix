{ config, lib, ... }: {
  options.myModules.tools.lf.enable = lib.mkEnableOption "Enable lf";

  config = lib.mkIf config.myModules.tools.lf.enable {
    programs.lf = {
      enable = true;

      settings = {
        number = true;
        relativenumber = true;
        tabstop = 4;
      };
    };
  };
}
