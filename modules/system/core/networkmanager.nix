{ config, lib, ... }: {
  options.myModules.core.networkmanager.enable = lib.mkEnableOption "Enable NetworkManager";

  config = lib.mkIf config.myModules.core.networkmanager.enable {
    networking.networkmanager.enable = true;

    environment.persistence."/persist/system".directories = [
      {
        directory = "/etc/NetworkManager/system-connections";
        mode = "0700";
      }
    ];
  };
}
