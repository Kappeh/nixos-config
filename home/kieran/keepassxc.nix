{ config, pkgs, ... }: {
  config.home = {
    packages = [ pkgs.keepassxc ];

    persistence."/persist/home/kieran".directories = [
      ".cache/keepassxc/"
      ".config/keepassxc/"
    ];
  };
}
