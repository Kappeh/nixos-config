{ inputs, pkgs, ... }: {
  imports = [
    ./scripts/default.nix
    ./services/default.nix
    ./ssh.nix

    ../../modules/system/default.nix

    inputs.sops-nix.nixosModules.sops
  ];

  config = {
    myModules = {
      applications = {
        enable = true;
        messaging.discord.enable = false;
        media = {
          mpd.enable = false;
          mpd_mpris.enable = false;
          rmpc.enable = false;
        };
      };
      core.enable = true;
      desktop.enable = true;
      shares = {
        media_library_1.enable = true;
        music_library_1.enable = true;
      };
      shells.enable = true;
      virtualisation = {
        enable = false;
        docker.enable = true;
      };
      tools.enable = true;
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
