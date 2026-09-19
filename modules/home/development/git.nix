{ config, lib, ... }: {
  options.kappeh.development.git.enable = lib.mkEnableOption "Enable git";

  config.programs.git = lib.mkIf config.kappeh.development.git.enable {
    enable = true;
    signing.format = null;
    settings.user = {
      name = "Kappeh";
      email = "github.dealmaker606@slmail.me";
    };
  };
}

