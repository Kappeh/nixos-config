{ config, lib, pkgs, ... }: {
  options.myModules.applications.misc.monero_gui.enable = lib.mkEnableOption "Enable Monero GUI";

  config.home = lib.mkIf config.myModules.applications.misc.monero_gui.enable {
    packages = [ pkgs.monero-gui ];

    persistence."/persist/home/${config.home.username}".directories = [
      ".bitmonero"
      ".cache/monero-project"
      ".config/monero-project"
      ".shared_ringdb"
      "Monero"
    ];
  };
}
