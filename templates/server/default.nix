{ inputs, ... }: {
  imports = [
    # ./kieran.nix
    ./network.nix
    ./services/default.nix
    ./ssh.nix

    ../../modules/system/default.nix
    ../../modules/users/default.nix

    inputs.sops-nix.nixosModules.sops
  ];

  config = {
    myModules = {
      core = {
        home_manager.enable = true;
        opengl.enable = true;
        sops.enable = true;
        ssl.enable = true;
        ssh.enable = true;
        systemd_boot.enable = true;
      };
      shells = {
        enable = true;
        rust.enable = false;
      };
      tools = {
        enable = true;
        bluetui.enable = false;
        f3.enable = false;
        playerctl.enable = false;
        pulsemixer.enable = false;
      };
      virtualisation.docker.enable = true;
    };

    boot.supportedFilesystems = [ "nfs" ];
    environment.persistence."/persist/system".directories = [ "/mnt/" ];

    time.timeZone = "Etc/UTC";    # Set your time zone.
  };
}
