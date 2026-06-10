{ ... }: {
  imports = [
    ./applications/default.nix
    ./core/default.nix
    ./desktop/default.nix
    ./shares/default.nix
    ./shells/default.nix
    ./users/default.nix
    ./virtualisation/default.nix
  ];
}
