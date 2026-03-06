{ config, lib, ... }: {
  options.myModules.tools.gh.enable = lib.mkEnableOption "Enable gh";

  config = lib.mkIf config.myModules.tools.gh.enable {
    programs.gh.enable = true;

    home.persistence."/persist".directories = [ ".config/gh" ];
  };
}
