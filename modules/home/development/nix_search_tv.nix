{ config, lib, ... }: {
  options.kappeh.development.nix_search_tv.enable = lib.mkEnableOption "Enable nix-search-tv";

  config = lib.mkIf config.kappeh.development.nix_search_tv.enable {
    home.persistence."/persist".directories = [
      ".cache/nix-search-tv"
    ];

    programs.nix-search-tv = {
      enable = true;
      settings = {
        indexes = [
          "home-manager"
          "nixos"
          "nixpkgs"
          "nur"
        ];
        update_interval = "24h";
      };
    };

    programs.zsh.shellAliases = {
      ns = "nix-search-tv print | fzf -i --preview 'nix-search-tv preview {}' --scheme history --layout reverse";
    };
  };
}

