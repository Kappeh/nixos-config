{ config, ... }: {
  config.home.persistence."/persist/home/kieran".directories = [ ".config/dconf" ];
}
