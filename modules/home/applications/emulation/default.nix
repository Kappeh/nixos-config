{ config, lib, ... }: {
  imports = [
    ./cemu.nix
    ./citra.nix
    ./desmume.nix
    ./dolphin_emu.nix
    ./fceux.nix
    ./mgba.nix
    ./mupen64plus.nix
    ./snes9x.nix
  ];

  options.myModules.applications.emulation.enable = lib.mkEnableOption "Enable emulation";

  config.myModules.applications.emulation = {
    cemu.enable = lib.mkDefault config.myModules.applications.emulation.enable;
    citra.enable = lib.mkDefault config.myModules.applications.emulation.enable;
    desmume.enable = lib.mkDefault config.myModules.applications.emulation.enable;
    dolphin_emu.enable = lib.mkDefault config.myModules.applications.emulation.enable;
    fceux.enable = lib.mkDefault config.myModules.applications.emulation.enable;
    mgba.enable = lib.mkDefault config.myModules.applications.emulation.enable;
    mupen64plus.enable = lib.mkDefault config.myModules.applications.emulation.enable;
    snes9x.enable = lib.mkDefault config.myModules.applications.emulation.enable;
  };
}
