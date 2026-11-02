{ config, lib, ... }: {
  imports = [
    ./bluetui.nix
    ./impala.nix
    ./wireshark.nix
  ];

  options.kappeh.networking.enable = lib.mkEnableOption "Enable networking capability";

  config.kappeh.networking = with config.kappeh; {
    bluetui.enable = lib.mkDefault networking.enable;
    impala.enable = lib.mkDefault networking.enable;
    wireshark.enable = lib.mkDefault networking.enable;
  };
}

