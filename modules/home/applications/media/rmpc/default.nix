{ config, lib, ... }: {
  options.myModules.applications.media.rmpc.enable = lib.mkEnableOption "Enable rmpc";

  config.programs.rmpc = lib.mkIf config.myModules.applications.media.rmpc.enable {
    enable = true;
    config = builtins.readFile ./config.ron;
  };
}
