{ config, lib, ... }: {
  options.kappeh.development.delta.enable = lib.mkEnableOption "Enable delta";

  config.programs.delta =  lib.mkIf config.kappeh.development.delta.enable {
    enable = true;
    enableGitIntegration = true;
    options = {
      side-by-side = true;
    };
  };
}

