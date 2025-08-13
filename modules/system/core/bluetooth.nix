{ config, lib, ... }: {
  options.myModules.core.bluetooth.enable = lib.mkEnableOption "Enable Bluetooth";

  config = lib.mkIf config.myModules.core.bluetooth.enable {
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

    environment.persistence = lib.mkIf config.myModules.core.impermanence.enable {
      "/persist/system".directories = [
        {
          directory = "/var/lib/bluetooth";
          mode = "0700";
        }
      ];
    };
  };
}
