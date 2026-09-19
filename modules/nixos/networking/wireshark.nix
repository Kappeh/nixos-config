{ config, lib, ... }: {
  options.kappeh.networking.wireshark.enable = lib.mkEnableOption "Enable Wireshark";

  config = lib.mkIf config.kappeh.networking.wireshark.enable {
    programs.wireshark.enable = true;

    # Allow non-root user to capture network packets without needing superuser privileges
    users.users.kieran.extraGroups = [ "wireshark" ];
  };
}

