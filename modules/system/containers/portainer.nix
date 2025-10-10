{ config, lib, pkgs, ... }: {
  options.myModules.containers.portainer.enable = lib.mkEnableOption "Enable hello-world container";

  config = lib.mkIf config.myModules.containers.portainer.enable {
    environment.persistence."/persist/system".directories = [
      "/containers/portainer/data"
    ];

    virtualisation.oci-containers.containers.portainer = {
      autoRemoveOnStop = true;
      autoStart = true;
      capabilities = {};
      cmd = [];
      dependsOn = [];
      devices = [];
      entrypoint = null;
      environment = {};
      environmentFiles = [];
      extraOptions = [];
      hostname = "portainer";
      image = "portainer/portainer-ce:2.33.2";
      labels = {};
      log-driver = "journald";
      networks = [];
      podman = null; # This MUST be null when using docker backend
      ports = [
        "9443:9443"
      ];
      privileged = true;
      pull = "missing"; # "always", "missing", "never" or "newer"
      serviceName = "portainer";
      user = null;
      volumes = [
        "/var/run/docker.sock:/var/run/docker.sock"
        "/containers/portainer/data:/data"
      ];
      workdir = null;
    };
  };
}
