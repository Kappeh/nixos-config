{ config, lib, ... }: {
  options.kappeh.gaming.alvr.enable = lib.mkEnableOption "Enable ALVR";

  config = lib.mkIf config.kappeh.gaming.alvr.enable {
    programs.alvr = {
      enable = true;
      openFirewall = true;
    };
  };
}

