{ config, pkgs, ... }: {
  config.home = {
    packages = [ pkgs.qmk ];
    
    persistence."/persist/home/kieran".directories = [
      "qmk_firmware"
      ".config/qmk/"
    ];
  };
}
