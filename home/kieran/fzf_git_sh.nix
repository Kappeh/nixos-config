{ config, pkgs, ... }: {
  config.home.packages = [ pkgs.fzf-git-sh ];
}
