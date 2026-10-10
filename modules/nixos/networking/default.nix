{ config, lib, ... }: {
  imports = [
    ./wireguard/default.nix
    ./openssh.nix
    ./resolved.nix
    ./ssh.nix
    ./wireshark.nix
  ];

  options.kappeh.networking = {
    enable = lib.mkEnableOption "Enable networking capability";

    bluetui.enable = lib.mkEnableOption "Enable bluetui";
  };

  config.kappeh.networking = with config.kappeh; {
    openssh.enable = lib.mkDefault networking.enable;
    ssh.enable = lib.mkDefault networking.enable;
    wireguard.enable = lib.mkDefault networking.enable;
    wireshark.enable = lib.mkDefault networking.enable;

    bluetui.enable = lib.mkDefault networking.enable;
  };
}

