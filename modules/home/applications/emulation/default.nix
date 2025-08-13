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

  config = lib.mkIf config.myModules.applications.emulation.enable {
    myModules.applications.emulation = {
      cemu.enable = lib.mkDefault true;
      citra.enable = lib.mkDefault true;
      desmume.enable = lib.mkDefault true;
      dolphin_emu.enable = lib.mkDefault true;
      fceux.enable = lib.mkDefault true;
      mgba.enable = lib.mkDefault true;
      mupen64plus.enable = lib.mkDefault true;
      snes9x.enable = lib.mkDefault true;
    };
  };
}
