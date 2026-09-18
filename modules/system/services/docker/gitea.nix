{ config, lib, ... }: {
  options.myModules.services.docker.gitea.enable = lib.mkEnableOption "Enable gitea service";

  config = lib.mkIf config.myModules.services.docker.gitea.enable {
    networking.firewall.allowedTCPPorts = [ 3000 ];
  };
}
