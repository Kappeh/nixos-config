{ config, lib, pkgs, inputs, ... }:
let
  tuigreet = "${pkgs.tuigreet}/bin/tuigreet";
  session = "${inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland}/bin/start-hyprland";
  username = "kieran";
in {
  options.myModules.desktop.greetd.enable = lib.mkEnableOption "Enable greetd";

  # Automatic login with greetd and tuigreet
  # https://discourse.nixos.org/t/autologin-hyprland/38159/12
  config = lib.mkIf config.myModules.desktop.greetd.enable {
    environment.systemPackages = [ pkgs.tuigreet ];

    services.greetd = {
      enable = true;
      restart = false;
      settings = {
        initial_session = {
          command = "${session}";
          user = "${username}";
        };
        default_session = {
          command = "${tuigreet} --greeting 'Welcome, my name is Neri!' --asterisks --remember --remember-user-session --time --time-format '%A %d/%m/%Y %H:%M:%S' -cmd ${session}";
          user = "greeter";
        };
      };
    };

    environment.persistence."/persist/system".directories = [
      {
        # Used to remember the most recent user and session
        directory = "/var/cache/tuigreet";
        user = "greeter";
        group = "greeter";
        mode = "u=rwx,g=rx,o=rx";
      }
    ];
  };
}
