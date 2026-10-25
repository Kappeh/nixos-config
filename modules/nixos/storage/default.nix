{ config, lib, ... }: {
  imports = [
    ./shares/default.nix
    ./auto_scrub.nix
    ./btrbk.nix
    ./filesystems.nix
    ./tmp.nix
  ];

  options.kappeh.storage = {
    enable = lib.mkEnableOption "Enable storage capability";

    btdu.enable = lib.mkEnableOption "Enable btdu";
    f3.enable = lib.mkEnableOption "Enable f3";
    udiskie.enable = lib.mkEnableOption "Enable udiskie";
  };

  config.kappeh.storage = with config.kappeh; {
    auto_scrub.enable = lib.mkDefault storage.enable;
    btrbk.enable = lib.mkDefault storage.enable;

    btdu.enable = lib.mkDefault storage.enable;
    f3.enable = lib.mkDefault storage.enable;
    udiskie.enable = lib.mkDefault storage.enable;
  };
}

