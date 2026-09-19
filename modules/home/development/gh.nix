{ config, lib, ... }: {
  options.kappeh.development.gh.enable = lib.mkEnableOption "Enable gh";

  config = lib.mkIf config.kappeh.development.gh.enable {
    home.persistence."/persist".directories = [ ".config/gh" ];

    programs.gh.enable = true;
  };
}

