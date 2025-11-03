{ config, lib, ... }: {
  options.myModules.tools.nix_search_tv.enable = lib.mkEnableOption "Enable nix-search-tv";

  config = lib.mkIf config.myModules.tools.nix_search_tv.enable {
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

    home.persistence."/persist/home/${config.home.username}".directories = [
      ".cache/nix-search-tv"
    ];
  };
}
