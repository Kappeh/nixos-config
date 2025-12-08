{ inputs, ... }: {
  imports = [
    ./kieran.nix
    ./network.nix
    ./services/default.nix
    ./ssh.nix

    ../../modules/system/default.nix

    inputs.sops-nix.nixosModules.sops
  ];

  config = {
    myModules = {
      core = {
        home_manager.enable = true;
        opengl.enable = true;
        sops.enable = true;
        ssl.enable = true;
        systemd_boot.enable = true;
      };
      shells.enable = true;

      # users.normal.kieran.enable = false;
    };

    services.qemuGuest.enable = true;

    time.timeZone = "Etc/UTC";    # Set your time zone.
  };
}
