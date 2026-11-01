{ lib }: let
  menu = lib.types.listOf (
    lib.types.oneOf [
      command
      submenu
    ]
  );

  command = lib.types.addCheck (lib.types.submodule {
    options = {
      icon = lib.mkOption {
        type = lib.types.str;
      };

      text = lib.mkOption {
        type = lib.types.str;
      };

      type = lib.mkOption {
        type = lib.types.enum [ "command" ];
        default = "command";
      };

      command = lib.mkOption {
        type = lib.types.str;
      };
    };
  }) (x: x.type == "command");

  submenu = lib.types.addCheck (lib.types.submodule {
    options = {
      icon = lib.mkOption {
        type = lib.types.str;
      };

      text = lib.mkOption {
        type = lib.types.str;
      };

      type = lib.mkOption {
        type = lib.types.enum [ "submenu" ];
        default = "submenu";
      };

      submenu = lib.mkOption {
        type = menu;
      };
    };
  }) (x: x.type == "submenu");
in {
  inherit menu command submenu;
}

