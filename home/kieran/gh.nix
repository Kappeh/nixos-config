{ config, ... }: {
  config = {
    programs.gh.enable = true;

    home.persistence."/persist/home/kieran".directories = [ ".config/gh" ];
  };
}
