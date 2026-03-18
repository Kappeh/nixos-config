{ config, lib, pkgs, ... }: {
  options.myModules.applications.messaging.element_desktop.enable = lib.mkEnableOption "Enable Element";

  config = lib.mkIf config.myModules.applications.messaging.element_desktop.enable {
    programs.element-desktop = {
      enable = true;

      settings = {
        default_server_config = {
          "m.homeserver" = {
            base_url = "https://matrix.smonk.ing";
            server_name = "smonk.ing";
          };
          "m.identity_server".base_url = "https://vector.im";
        };
        default_theme = "dark";
        disable_custom_urls = false;
        disable_guests = false;
        disable_login_language_selector = false;
        disable_3pid_login = false;
        force_verification = false;
        brand = "Element";
        integrations_ui_url = "https://scalar.vector.im/";
        integrations_rest_url = "https://scalar.vector.im/";
        branding = {
          welcome_background_url = "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fstatic.vecteezy.com%2Fsystem%2Fresources%2Fpreviews%2F016%2F308%2F634%2Flarge_2x%2Fabstract-technological-blue-background-a-wave-with-connecting-dots-and-lines-scientific-data-large-digital-background-3d-rendering-free-photo.jpg";
        };
      };
    };

    # Workaround for this electron bug
    # https://github.com/NixOS/nixpkgs/issues/415765
    xdg.desktopEntries.element-desktop = {
      name = "Element";
      genericName = "Matrix Client";
      comment = "A feature-rich client for Matrix.org";
      categories = [
        "Network"
        "InstantMessaging"
        "Chat"
      ];
      icon = "element";
      mimeType = [
        "x-scheme-handler/element"
      ];
      type = "Application";
      exec = "element-desktop --password-store=gnome-libsecret %u";
      settings.StartupWMClass = "Element";
    };

    home.persistence."/persist".directories = [ ".config/Element" ];
  };
}
