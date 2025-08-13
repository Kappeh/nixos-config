{ config, lib, pkgs, ... }: {
  options.myModules.tools.fzf_git_sh.enable = lib.mkEnableOption "Enable fzf_git_sh";

  config = lib.mkIf config.myModules.tools.fzf_git_sh.enable {
    home.packages = [ pkgs.fzf-git-sh ];
  };
}
