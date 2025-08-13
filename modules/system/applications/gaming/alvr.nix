{ config, lib, ... }: {
  options.myModules.applications.gaming.alvr.enable = lib.mkEnableOption "Enable ALVR";

  config = lib.mkIf config.myModules.applications.gaming.alvr.enable {
    programs.alvr = {
      enable = true;
      openFirewall = true;
    };
  };
}
