{ config, lib, pkgs, ... }: {
  options.myModules.applications.emulation.dolphin_emu.enable = lib.mkEnableOption "Enable Dolphin Emulator";

  config = lib.mkIf config.myModules.applications.emulation.dolphin_emu.enable {
    home.packages = [ pkgs.dolphin-emu ];
  };
}
