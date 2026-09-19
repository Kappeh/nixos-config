{ config, lib, ... }: {
  options.kappeh.shell.bat.enable = lib.mkEnableOption "Enable bat";

  config.programs.bat = lib.mkIf config.kappeh.shell.bat.enable {
    enable = true;
    config.style = "numbers,changes,header";
  };
}

