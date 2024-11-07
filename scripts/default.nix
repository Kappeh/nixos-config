{ pkgs, ... }:
let
  device_script = pkgs.writeScriptBin "device" (builtins.readFile ./device.sh);
  fs_diff_script = pkgs.writeScriptBin "fs_diff" (builtins.readFile ./fs_diff.sh);
  rofi_mount_script = pkgs.writeScriptBin "rofi_mount" (builtins.readFile ./rofi_mount.sh);
  set_bg_script = pkgs.writeScriptBin "set_bg" (builtins.readFile ./set_bg.sh);
in {
  environment.systemPackages = [
    device_script
    fs_diff_script
    rofi_mount_script
    set_bg_script
  ];
}
