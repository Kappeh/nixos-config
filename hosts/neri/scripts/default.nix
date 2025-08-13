{ config, pkgs, ... }:
let
  fs_diff_script = pkgs.writeScriptBin "fs_diff" (builtins.readFile ./fs_diff.sh);
in {
  config.environment.systemPackages = [ fs_diff_script ];
}
