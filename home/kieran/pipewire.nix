{ config, ... }: {
  config.home.persistence."/persist/home/kieran".directories = [
    ".config/pulse" # I do not know whether this needs to stick around or not
    ".local/state/wireplumber"
  ];
}
