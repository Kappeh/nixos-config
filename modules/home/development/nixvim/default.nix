{ config, inputs, lib, ... }: {
  imports = [
    inputs.nixvim.homeModules.nixvim

    ./colors.nix
    ./keymaps.nix
    ./lsp.nix
    ./options.nix
    ./plugins/default.nix
  ];

  options.kappeh.development.nixvim.enable = lib.mkEnableOption "Enable nixvim";

  config = lib.mkIf config.kappeh.development.nixvim.enable {
    home.persistence."/persist".directories = [
      ".local/share/nvim"
    ];

    programs.nixvim.enable = true;
  };
}

