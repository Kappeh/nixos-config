{ config, ... }: {
  imports = [
    ./applications/default.nix
    ./core/default.nix
    ./desktop/default.nix
    ./shells/default.nix
    ./tools/default.nix
  ];
}
