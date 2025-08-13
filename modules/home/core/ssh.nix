{ config, lib, osConfig, ... }: {
  options.myModules.core.ssh.enable = lib.mkEnableOption "Enable SSH";

  config = lib.mkIf config.myModules.core.ssh.enable {
    home.persistence = lib.mkIf osConfig.myModules.core.impermanence.enable {
      "/persist/home/${config.home.username}".directories = [ ".ssh" ];
    };
  };
}
