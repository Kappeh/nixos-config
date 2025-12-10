{ config, lib, ... }: {
  options.myModules.tools.git.enable = lib.mkEnableOption "Enable git";

  config = lib.mkIf config.myModules.tools.git.enable {
    programs.git = {
      enable = true;
      settings.user = {
        name = "Kappeh";
        email = "github.dealmaker606@slmail.me";
      };
    };
  };
}
