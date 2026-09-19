{ config, lib, ... }: {
  imports = [
    ./btdu.nix
    ./f3.nix
    ./udiskie.nix
  ];

  options.kappeh.storage.enable = lib.mkEnableOption "Enable storage capability";

  config.kappeh.storage = with config.kappeh; {
    btdu.enable = lib.mkDefault storage.enable;
    f3.enable = lib.mkDefault storage.enable;
    udiskie.enable = lib.mkDefault storage.enable;
  };
}

