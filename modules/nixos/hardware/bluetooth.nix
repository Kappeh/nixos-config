{ config, lib, ... }: {
  options.kappeh.hardware.bluetooth.enable = lib.mkEnableOption "Enable bluetooth capability";

  config = lib.mkIf config.kappeh.hardware.bluetooth.enable {
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
          Enable = "Source,Sink,Media,Socket";
          Experimental = true;
        };
      };
    };

    environment.persistence."/persist/system".directories = [
      {
        directory = "/var/lib/bluetooth";
        mode = "0700";
      }
    ];
  };
}

