{ pkgs, ... }: {
  config.environment.systemPackages = [
    (pkgs.writeShellScriptBin "fs_diff" (builtins.readFile ./fs_diff.sh))
  ];
}

