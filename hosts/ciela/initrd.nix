{ config, ... }: {
  config.boot.initrd = {
    # Specify kernel modules to be included in the initial RAM disk.
    availableKernelModules = [
      "e1000e"  # Intel network driver for Ethernet devices.
      "ptp"     # Precision Time Protocol support.
    ];

    network = {
      enable = true;  # Enable network support during the initrd phase.
      ssh = {
        enable = true;  # Enable SSH access during the initrd.
        hostKeys = [ "/persist/system/etc/secrets/initrd/ciela_initrd_host_key_ed25519" ];
        authorizedKeys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOCUJsStgjTCObc7BrzoGDE3tj633SbghefFM2wk20gX local" ];
      };
    };

    systemd = {
      enable = true;  # Enable systemd services in the initrd.

      # Drop the root user straight into the password prompt on connection
      users.root.shell = "/bin/systemd-tty-ask-password-agent";
      network = config.systemd.network;
    };
  };
}
