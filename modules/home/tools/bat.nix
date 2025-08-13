{ config, lib, ... }: {
  options.myModules.tools.bat.enable = lib.mkEnableOption "Enable bat";

  config = lib.mkIf config.myModules.tools.bat.enable {
    programs.bat = {
      enable = true;

      config = {
        style = "numbers,changes,header";
        theme = "Nord";
      };
    };
  };
}
