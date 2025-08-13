{ config, osConfig, lib, ... }: {
  config.home.persistence = lib.mkIf osConfig.myModules.core.impermanence.enable {
    "/persist/home/${config.home.username}".directories = [
      ".cargo"
      ".rustup"
    ];
  };
}
