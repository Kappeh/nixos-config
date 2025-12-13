{ config, lib, ... }: {
  options.myModules.applications.media.rmpc.enable = lib.mkEnableOption "Enable rmpc";

  config = lib.mkIf config.myModules.applications.media.rmpc.enable {
    programs.rmpc = {
      enable = true;
      config = builtins.readFile ./config.ron;
    };

    home.file."rmpc-theme.ron" = {
      enable = true;
      text = builtins.readFile ./theme.ron;
      target = ".config/rmpc/theme.ron";
      executable = false;
    };
  };
}
