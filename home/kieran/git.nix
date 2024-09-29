{ ... }: {
  programs.git = {
    enable = true;
    userName = "Kappeh";
    userEmail = "github.dealmaker606@slmail.me";

    delta = {
      enable = true;
      options = {
        side-by-side = true;
      };
    };
  };
}
