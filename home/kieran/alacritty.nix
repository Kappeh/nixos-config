{ ... }: {
  programs.alacritty = {
    enable = true;

    settings = {
      window = {
        opacity = 0.8;
      };
      cursor.style = {
        shape = "Beam";
        blinking = "On";
      };
    };
  };
}
