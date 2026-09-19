{ lib, ... }: {
  imports = [
    ./pipewire.nix
    ./playerctl.nix
    ./pulsemixer.nix
    ./qpwgraph.nix
  ];

  options.kappeh.audio.enable = lib.mkEnableOption "Enable audio capability";
}

