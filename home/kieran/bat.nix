{ config, ... }: {
  config.programs.bat = {
    enable = true;

    config = {
      style = "numbers,changes,header";
      theme = "Nord";
    };
  };
}
