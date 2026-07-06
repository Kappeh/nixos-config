{ pkgs, ... }: let
  smartd_notify_bridge = pkgs.writeShellScriptBin "smartd_notify_bridge" ''
    USER="kieran"
    UID=$(id -u "$USER")

    export XDG_RUNTIME_DIR="/run/user/$UID"
    export DBUS_SESSION_BUS_ADDRESS="unix:path=$XDG_RUNTIME_DIR/bus"

    ${pkgs.libnotify}/bin/notify-send \
      -u critical \
      "SMART alert" \
      "$SMARTD_MESSAGE"
  '';
in {
  config = {
    environment = {
      systemPackages = [ pkgs.smartmontools ];
      persistence."/persist/system".directories = [ "/var/lib/smartd" ];
    };

    services.smartd = {
      enable = true;
      autodetect = false;
      extraOptions = [
        "--interval=3600"
        "--savestates=/var/lib/smartd/"
        "--warnexec ${smartd_notify_bridge}/bin/smartd_notify_bridge"
      ];
      devices = [
        {
          device = "/dev/disk/by-id/ata-Samsung_SSD_850_PRO_1TB_S2BBNWAJ202605D";
          options = "-a -s (S/../../7/00|L/../01/./00)";
        }
        {
          device = "/dev/disk/by-id/ata-Samsung_SSD_870_QVO_4TB_S5STNF0T405957D";
          options = "-a -s (S/../../7/00|L/../01/./00)";
        }
      ];
    };
  };
}
