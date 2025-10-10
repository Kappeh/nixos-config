{ ... }: {
  imports = [
    ./applications/default.nix
    ./containers/default.nix
    ./core/default.nix
    ./desktop/default.nix
    ./shells/default.nix
    ./virtualisation/default.nix
  ];
}
