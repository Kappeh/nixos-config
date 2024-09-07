{ pkgs, ... }:
let
  device_script = pkgs.writeScriptBin "device" (builtins.readFile ./device.sh);
  fs_diff_script = pkgs.writeScriptBin "fs_diff" (builtins.readFile ./fs_diff.sh);
  set_bg_script = pkgs.writeScriptBin "set_bg" (builtins.readFile ./set_bg.sh);
in {
  environment.systemPackages = [
    device_script
    fs_diff_script
    set_bg_script
  ];
}
