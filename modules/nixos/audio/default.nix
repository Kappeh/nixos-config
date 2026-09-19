{ lib, ... }: {
  imports = [
    ./pipewire.nix
  ];

  options.kappeh.audio.enable = lib.mkEnableOption "Enable audio capability";
}

