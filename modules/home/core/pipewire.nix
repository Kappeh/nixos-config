{ config, lib, ... }: {
  options.myModules.core.pipewire.enable = lib.mkEnableOption "Enable PipeWire";

  config.home.persistence."/persist".directories = lib.mkIf config.myModules.core.pipewire.enable [
    ".config/pulse" # I do not know whether this needs to stick around or not
    ".local/state/wireplumber"
  ];
}
