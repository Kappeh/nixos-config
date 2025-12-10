{ config, lib, ... }: {
  options.myModules.tools.delta.enable = lib.mkEnableOption "Enable delta";

  config.programs.delta =  lib.mkIf config.myModules.tools.delta.enable {
    enable = true;
    enableGitIntegration = true;
    options = {
      side-by-side = true;
    };
  };
}
