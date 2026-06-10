{ config, lib, ... }: {
  options.myModules.core.sops.enable = lib.mkEnableOption "Enable SOPS";

  config.home = lib.mkIf config.myModules.core.sops.enable {
    persistence."/persist".files = [ ".config/sops/age/keys.txt" ];
  };
}
