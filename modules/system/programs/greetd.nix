{ config, pkgs, ... }: {
  services.greetd = {
    enable = true;
    restart = false;
    settings = {
      default_session = {
        user = "kieran";
        command = "${pkgs.greetd.greetd}/bin/agreety --cmd Hyprland";
      };
    };
  };
}
