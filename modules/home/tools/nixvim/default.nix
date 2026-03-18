{ config, inputs, lib, ... }: {
  imports = [
    inputs.nixvim.homeModules.nixvim

    ./colors.nix
    ./keymaps.nix
    ./lsp.nix
    ./options.nix
    ./plugins/default.nix
  ];

  options.myModules.tools.nixvim.enable = lib.mkEnableOption "Enable nixvim";

  config = {
    programs.nixvim.enable = config.myModules.tools.nixvim.enable;

    home.persistence."/persist".directories = [
      ".local/share/nvim"
    ];
  };
}
