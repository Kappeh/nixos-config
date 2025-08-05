{ config, ... }: {
  config = {
    services.easyeffects = {
      enable = true;
      preset = "Default";
    };

    home.persistence."/persist/home/kieran".directories = [ ".config/easyeffects" ];
  };
}
