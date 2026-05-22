{ inputs, pkgs, ... }: {
  imports = [
    ./scripts/default.nix
    ./services/default.nix
    ./jellyfin.nix
    ./ssh.nix

    ../../modules/system/default.nix
    ../../modules/users/default.nix

    inputs.sops-nix.nixosModules.sops
  ];

  config = {
    myModules = {
      applications.enable = true;
      core.enable = true;
      desktop.enable = true;
      shells.enable = true;
      virtualisation = {
        enable = false;
        docker.enable = true;
      };
    };

    boot = {
      kernelPackages = pkgs.linuxPackages_latest;
      supportedFilesystems = [ "ntfs" "btrfs" ];
      tmp.cleanOnBoot = true;

      # Specify location of swapfile to use when attempting to resume during boot.
      # https://wiki.archlinux.org/title/Power_management/Suspend_and_hibernate#Manually_specify_hibernate_location
      # resumeDevice = "/dev/mapper/crypt1";
      # kernelParams = [ "resume_offset=56700969" ];
    };

    systemd.network.enable = true;
    networking = {
      useDHCP = false;                # Disable dhcp for static ip
      nameservers = [ "10.0.1.104" ]; # Use local dns server
    };
    services.resolved = {
      enable = true;
      settings.Resolve.fallbackDns = []; # Disable fallback dns server, only use the primary dns server
    };

    time.timeZone = "Europe/London"; # Set your time zone.
  };
}
