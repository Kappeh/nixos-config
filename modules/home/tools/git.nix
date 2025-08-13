{ config, lib, ... }: {
  options.myModules.tools.git.enable = lib.mkEnableOption "Enable git";

  config = lib.mkIf config.myModules.tools.git.enable {
    programs.git = {
      enable = true;
      userName = "Kappeh";
      userEmail = "github.dealmaker606@slmail.me";

      delta = {
        enable = true;
        options = {
          side-by-side = true;
        };
      };
    };
  };
}
