{ pkgs, ... }: {
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

