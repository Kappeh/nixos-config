{
  config = {
    # Use the systemd-boot EFI boot loader.
    boot.loader = {
      systemd-boot = {
        enable = true;
        editor = false;          # Recommended to set to false, as it allows gaining root access
        configurationLimit = 10; # To prevent boot partition running out of disk space
      };
      efi.canTouchEfiVariables = true;
    };
  };
}

