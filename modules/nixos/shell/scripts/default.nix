{ config, lib, pkgs, ... }: {
  options.kappeh.shell.scripts = {
    fs_diff.enable = lib.mkEnableOption "Enable fs_diff script";
  };

  config.environment.systemPackages = with config.kappeh.shell; builtins.concatLists [
    (lib.optional scripts.fs_diff.enable (pkgs.writeShellScriptBin "fs_diff" (builtins.readFile ./fs_diff.sh)))
  ];
}

