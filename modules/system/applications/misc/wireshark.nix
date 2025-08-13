{ config, lib, ... }: {
  options.myModules.applications.misc.wireshark.enable = lib.mkEnableOption "Enable Wireshark";

  config = lib.mkIf config.myModules.applications.misc.wireshark.enable {
    programs.wireshark.enable = true;
  };
}
