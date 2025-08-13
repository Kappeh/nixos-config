{ config, lib, osConfig, ... }: {
  options.myModules.tools.gh.enable = lib.mkEnableOption "Enable gh";

  config = lib.mkIf config.myModules.tools.gh.enable {
    programs.gh.enable = true;

    home.persistence = lib.mkIf osConfig.myModules.core.impermanence.enable {
      "/persist/home/${config.home.username}".directories = [ ".config/gh" ];
    };
  };
}
