{ config, ... }: {
  config.home.persistence."/persist/home/kieran".directories = [ ".cache/appimage-run" ];
}
