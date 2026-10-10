{
  description = "Nixos config flake";

  inputs = {
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";

    impermanence.url = "github:nix-community/impermanence";

    millennium.url = "github:SteamClientHomebrew/Millennium?dir=packages/nix";

    nixcord.url = "github:kaylorben/nixcord";

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nixvim = {
      url = "github:nix-community/nixvim";
      # inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, ... } @ inputs: {
    nixosConfigurations = {
      leaf = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [ ./hosts/leaf/configuration.nix ];
      };
      neri = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [ ./hosts/neri/configuration.nix ];
      };
    };
  };
}

