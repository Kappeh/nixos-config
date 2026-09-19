{ config, lib, ... }: {
  imports = [
    ./shares/default.nix
  ];

  options.kappeh.storage = {
    enable = lib.mkEnableOption "Enable storage capability";

    btdu.enable = lib.mkEnableOption "Enable btdu";
    f3.enable = lib.mkEnableOption "Enable f3";
    udiskie.enable = lib.mkEnableOption "Enable udiskie";
  };

  config.kappeh.storage = with config.kappeh; {
    btdu.enable = lib.mkDefault storage.enable;
    f3.enable = lib.mkDefault storage.enable;
    udiskie.enable = lib.mkDefault storage.enable;
  };
}

