{ config, ... }: {
  config.home.persistence."/persist/home/kieran".files = [ ".config/sops/age/keys.txt" ];
}
