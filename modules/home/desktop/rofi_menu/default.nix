{ lib, pkgs }: let
  types = import ./types.nix { inherit lib; };

  mkMenu = {
    name,
    menu,
    runtimeInputs ? with pkgs; [ rofi yq-go ],
  }: let
    checked_menu = (lib.evalModules {
      modules = [
        {
          options.menu = lib.mkOption {
            type = types.menu;
          };

          config.menu = menu;
        }
      ];
    }).config.menu;

    data = (pkgs.formats.yaml { }).generate "${name}_menu.yaml" checked_menu;

    runner = pkgs.writeShellApplication {
      name = "${name}_runner";

      inherit runtimeInputs;

      text = builtins.readFile ./runner.sh;
    };
  in
    pkgs.writeShellScriptBin name ''
      exec ${runner}/bin/${name}_runner ${data}
    '';
in {
  inherit mkMenu types;
}

