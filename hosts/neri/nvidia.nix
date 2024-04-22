{ config, ... }: {
  # Proprietary Nvidia drivers
  config.boot.kernelParams = [
    # Blacklist integrated gpu to prevent hanging on boot
    # TODO: find source for this beauty
    "module_blacklist=i915"
    # Workaround to remove "ghost display" (https://bbs.archlinux.org/viewtopic.php?id=288009)
    # Leaving disabled because it seems to be a Wayland thing and
    # it removes console output during boot, including the LUKS prompt
    #"initcall_blacklist=simpledrm_platform_driver_init"
    #"nvidia-drm.modeset=1"
  ];

  config.services.xserver.videoDrivers = [ "nvidia" ];

  config.hardware = {
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true; # Required for steam
    };
    nvidia = {
      modesetting.enable = true; # Required for native resolution in TTY
      powerManagement.enable = true;
      open = true;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable; # stable, production, latest, beta or vulkan_beta
    };
  };
}
