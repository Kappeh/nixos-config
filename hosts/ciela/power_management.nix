{
  config = {
    powerManagement = {
      enable = true;

      bootCommands = "";
      cpuFreqGovernor = null;
      cpufreq.min = null;
      cpufreq.max = null;
      powerDownCommands = "";
      powerUpCommands = "";
      resumeCommands = "";
      scsiLinkPolicy = null;

      powertop.enable = true;
      powertop.postStart = "";
      powertop.preStart = "";
    };

    services.thermald.enable = true;

    services.tlp = {
      enable = true;
      pd.enable = true;
      settings = {
        # By default, TLP stops the Wi-Fi radio from automatically powering on.
        DEVICES_TO_ENABLE_ON_STARTUP = "wifi";

        # Operation and Profiles
        #
        # Control automatic switching of the TLP profile when connecting or removing the charger, when booting the
        # system or when executing tlp start:
        # - 0 - disabled: never switch, use TLP_DEFAULT_MODE if configured.
        # - 1 - auto: always switch, select TLP_PROFILE_AC on AC and TLP_PROFILE_BAT on battery power.
        # - 2 - smart: like auto, but skips the switch if you have manually changed the profile away from the previous
        #       power source’s default profile – as defined by TLP_PROFILE_AC/BAT.
        TLP_AUTO_SWITCH = 2;
        #
        # TLP profiles to use for AC and battery power when automatic switching is enabled (TLP_AUTO_SWITCH=1 or 2).
        #     PRF BAL SAV
        TLP_PROFILE_AC = "PRF";
        TLP_PROFILE_BAT = "SAV";
        #
        # TLP profile to use when automatic switching is disabled (TLP_AUTO_SWITCH=0) or no power source is detected.
        #     PRF BAL SAV
        TLP_PROFILE_DEFAULT = "BAL";

        # Audio
        #
        # Timeout (in seconds) for the audio power saving mode (supports Intel HDA, AC97).
        SOUND_POWER_SAVE_ON_AC = 1;
        SOUND_POWER_SAVE_ON_BAT = 1;
        #
        # Y – power off the controller together with the sound chip
        # N – controller remains active
        SOUND_POWER_SAVE_CONTROLLER = "Y";

        # Battery Care
        #
        # Problematic on Framework laptops
        # See: https://linrunner.de/tlp/settings/bc-vendors.html#chromebooks-and-framework
        # START_CHARGE_THRESH_BAT1 = 75;
        # STOP_CHARGE_THRESH_BAT1 = 80;
        #
        # After the commands tlp fullcharge/recalibrate the charge thresholds will stay at the vendor specific defaults
        # until the next reboot. Use this feature to restore them prematurely.
        # RESTORE_THRESHOLDS_ON_BAT = 1;

        # Disks and Controllers
        #
        # Defines the disk devices on which the following parameters act.
        DISK_DEVICES = "nvme-WD_BLACK_SN7100_1TB_26011J802954";
        #
        # Controls runtime power management for NVMe, SATA, ATA and USB disks as well as SATA ports. Possible values:
        #     auto – enabled (power down idle devices)
        #     on – disabled (devices powered on permanently)
        AHCI_RUNTIME_PM_ON_AC = "on";
        AHCI_RUNTIME_PM_ON_BAT = "auto";
        #
        # Seconds of inactivity before a disk or a port is suspended. Effective only when AHCI_RUNTIME_PM_ON_AC/BAT is
        # activated.
        AHCI_RUNTIME_PM_TIMEOUT = 15;

        # Filesystem
        #
        # Timeout (in seconds) for writing unsaved data in file system buffers to disk.
        MAX_LOST_WORK_SECS_ON_AC = 15;
        MAX_LOST_WORK_SECS_ON_BAT = 60;

        # Networking
        #
        # Sets Wi-Fi power saving mode. Adapter support depends on kernel and driver.
        WIFI_PWR_ON_AC = "off";
        WIFI_PWR_ON_BAT = "on";
        #
        # Disable Wake-on-LAN
        WOL_DISABLE = "Y";

        # Platform
        #
        # Select the platform profile (implemented by the firmware) to control system operating characteristics around
        # power/performance levels, thermal and fan speed.
        #     low-power balanced performance
        PLATFORM_PROFILE_ON_AC = "performance";
        PLATFORM_PROFILE_ON_BAT = "balanced";
        PLATFORM_PROFILE_ON_SAV = "low-power";
        #
        # Select the system suspend mode.
        MEM_SLEEP_ON_AC = "s2idle";
        MEM_SLEEP_ON_BAT = "s2idle";

        # Processor
        #
        # Selects a CPU scaling driver operating mode. Configuration depends on the active driver:
        CPU_DRIVER_OPMODE_ON_AC = "active";
        CPU_DRIVER_OPMODE_ON_BAT = "active";
        CPU_DRIVER_OPMODE_ON_SAV = "active";
        #
        # Selects the CPU scaling governor for automatic frequency scaling. Configuration depends on the active driver.
        CPU_SCALING_GOVERNOR_ON_AC = "powersave";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
        CPU_SCALING_GOVERNOR_ON_SAV = "powersave";
        #
        # Define the min/max P-state for Intel CPUs. Values are stated as a percentage (0..100%) of the total available
        # processor performance.
        CPU_MIN_PERF_ON_AC = 0;
        CPU_MAX_PERF_ON_AC = 100;
        CPU_MIN_PERF_ON_BAT = 0;
        CPU_MAX_PERF_ON_BAT = 80;
        CPU_MIN_PERF_ON_SAV = 0;
        CPU_MAX_PERF_ON_SAV = 60;
        #
        # Configure CPU “turbo boost”.
        CPU_BOOST_ON_AC = 1;
        CPU_BOOST_ON_BAT = 1;
        CPU_BOOST_ON_SAV = 0;
        #
        # Configure the Intel CPU HWP dynamic boost feature.
        CPU_HWP_DYN_BOOST_ON_AC = 1;
        CPU_HWP_DYN_BOOST_ON_BAT = 1;
        CPU_HWP_DYN_BOOST_ON_SAV = 0;

        # Radio Device Switching
        #
        # Disables builtin radio devices on boot.
        DEVICES_TO_DISABLE_ON_STARTUP = "bluetooth wwan";
        #
        # Disables builtin radio devices that are not connected when changing to the balanced or power-saver profile.
        DEVICES_TO_DISABLE_ON_BAT_NOT_IN_USE="bluetooth wifi wwan";

        # USB Autosuspend
        #
        # Controls autosuspend for USB devices on boot and when plugged.
        USB_AUTOSUSPEND = 0;

        # PCIe Autosuspend and ASPM
        #
        # Controls autosuspend for PCIe devices.
        RUNTIME_PM_ON_AC = "on";
        RUNTIME_PM_ON_BAT = "auto";
        #
        # Exclude listed PCIe device addresses from autosuspend. Use lspci to lookup the addresses (first column).
        # RUNTIME_PM_DENYLIST = "11:22.3 44:55.6";
        #
        # Exclude PCIe devices assigned to listed drivers from autosuspend. Use tlp-stat -e to lookup the drivers.
        # RUNTIME_PM_DRIVER_DENYLIST = "amdgpu mei_me nouveau nvidia xhci_hcd";
        #
        # Sets PCIe ASPM power saving mode.
        #     default performance powersave powersupersave
        PCIE_ASPM_ON_AC = "default";
        PCIE_ASPM_ON_BAT = "default";
      };
    };
  };
}

