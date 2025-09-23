{ config, lib, ... }: {
  options.myModules.core.systemd_boot.enable = lib.mkEnableOption "Enable systemd-boot";

  config = lib.mkIf config.myModules.core.systemd_boot.enable {
    # Use the systemd-boot EFI boot loader.
    boot.loader = {
      systemd-boot = {
        enable = true;
        editor = false;           # Recommended to set to false, as it allows gaining root access
        configurationLimit = 100; # To prevent boot partition running out of disk space
      };
      efi.canTouchEfiVariables = true;
    };
  };
}
