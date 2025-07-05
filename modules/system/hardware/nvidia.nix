{ config, pkgs, lib, inputs, ... }: {
  config = {
    # Proprietary Nvidia drivers
    boot.kernelParams = [
      # Blacklist integrated gpu to prevent hanging on boot
      # TODO: find source for this beauty
      "module_blacklist=i915"
    ];

    services.xserver = {
      videoDrivers = [ "nvidia" ];

      # This helps fix tearing of windows for Nvidia cards
      screenSection = ''
        Option       "metamodes" "nvidia-auto-select +0+0 {ForceFullCompositionPipeline=On}"
        Option       "AllowIndirectGLXProtocol" "off"
        Option       "TripleBuffer" "on"
      '';
    };

    hardware = {
      graphics = {
        enable = true;
        enable32Bit = true; # Required for steam
      };

      nvidia = {
        modesetting.enable = true; # Required for native resolution in TTY

        powerManagement = {
          enable = true;
          finegrained = false;
        };

        open = true;
        nvidiaSettings = true;

        package = config.boot.kernelPackages.nvidiaPackages.beta; # stable, production, latest, beta or vulkan_beta
      };
    };
  };
}
