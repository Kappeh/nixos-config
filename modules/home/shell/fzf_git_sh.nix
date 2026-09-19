{ config, lib, pkgs, ... }: {
  options.kappeh.shell.fzf_git_sh.enable = lib.mkEnableOption "Enable fzf_git_sh";

  config = lib.mkIf config.kappeh.shell.fzf_git_sh.enable {
    home.packages = [ pkgs.fzf-git-sh ];
  };
}

