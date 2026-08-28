{ ... }: {
  imports = [
    ./applications/default.nix
    ./core/default.nix
    ./desktop/default.nix
    ./scripts/default.nix
    ./shares/default.nix
    ./shells/default.nix
    ./tools.nix
    ./users/default.nix
    ./virtualisation/default.nix
  ];
}
