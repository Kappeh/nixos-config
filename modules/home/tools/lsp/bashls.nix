{ config, lib, pkgs, ... }: {
  options.myModules.tools.lsp.bashls.enable = lib.mkEnableOption "Enable bash-language-server";

  config = lib.mkIf config.myModules.tools.lsp.bashls.enable {
    home.packages = [ pkgs.bash-language-server ];
  };
}
