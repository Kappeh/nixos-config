{ config, inputs, lib, ... }: {
  imports = [
    inputs.nixvim.homeModules.nixvim

    ./keymaps.nix
    ./lsp.nix
    ./options.nix
    ./plugins/default.nix
  ];

  options.myModules.tools.nixvim.enable = lib.mkEnableOption "Enable nixvim";

  config = {
    programs.nixvim.enable = config.myModules.tools.nixvim.enable;

    home.persistence."/persist/home/${config.home.username}".directories = [
      ".local/share/nvim"
    ];
  };
}
