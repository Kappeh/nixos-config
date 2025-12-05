{ config, lib, ... }: {
  options.myModules.core.nvidia.enable = lib.mkEnableOption "Enable Nvidia";

  config = lib.mkIf config.myModules.core.nvidia.enable {
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

    hardware.nvidia = {
      modesetting.enable = true; # Required for native resolution in TTY

      powerManagement = {
        enable = true;
        finegrained = false;
      };

      # Disabled temporarily because of a bug in the open nvidia driver derivation for version 580.76.08
      # open = true;
      open = false;
      nvidiaSettings = true;

      # Pinned due to a bug in version 580.105.08
      # https://forums.developer.nvidia.com/t/undetected-ultrawide-resolution-upon-upgrade-to-driver-version-580-105-08/350969
      # package = config.boot.kernelPackages.nvidiaPackages.beta; # stable, production, latest, beta or vulkan_beta
      package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
        version = "580.76.05";
        sha256_64bit = "sha256-IZvmNrYJMbAhsujB4O/4hzY8cx+KlAyqh7zAVNBdl/0=";
        sha256_aarch64 = "sha256-IZvmNrYJMbAhsujB4O/4hzY8cx+KlAyqh7zAVNBdl/0=";
        openSha256 = "sha256-ZpuVZybW6CFN/gz9rx+UJvQ715FZnAOYfHn5jt5Z2C8=";
        settingsSha256 = "sha256-ZpuVZybW6CFN/gz9rx+UJvQ715FZnAOYfHn5jt5Z2C8=";
        persistencedSha256 = lib.fakeSha256;
      };
    };
  };
}

