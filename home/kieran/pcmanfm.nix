{ config, pkgs, ... }: {
  config.home = {
    packages = [ pkgs.pcmanfm ];

    persistence."/persist/home/kieran".directories = [
      ".config/libfm"
      ".config/pcmanfm/default"
    ];
  };
}
