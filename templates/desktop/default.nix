{ inputs, pkgs, ... }: {
  imports = [
    ./scripts/default.nix
    ./services/default.nix
    ./ssh.nix

    ../../modules/system/default.nix
    ../../modules/users/default.nix

    inputs.sops-nix.nixosModules.sops
  ];

  config = {
    myModules = {
      applications.enable = true;
      containers.portainer.enable = true;
      core.enable = true;
      desktop.enable = true;
      shells.enable = true;
      virtualisation.enable = true;
    };

    boot = {
      kernelPackages = pkgs.linuxPackages_latest;
      # Simply for mounting NTFS filesystems such as external drives
      supportedFilesystems = [ "ntfs" ];
      # Specify location of swapfile to use when attempting to resume during boot.
      # https://wiki.archlinux.org/title/Power_management/Suspend_and_hibernate#Manually_specify_hibernate_location
      # resumeDevice = "/dev/mapper/crypt1";
      # kernelParams = [ "resume_offset=56700969" ];
    };

    time.timeZone = "Europe/London"; # Set your time zone.
  };
}
