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

    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";

    nixcord.url = "github:kaylorben/nixcord";

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
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
      ciela = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/ciela/configuration.nix
          inputs.home-manager.nixosModules.default
          inputs.impermanence.nixosModules.impermanence
          inputs.stylix.nixosModules.stylix
        ];
      };
      leaf = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/leaf/configuration.nix
          inputs.home-manager.nixosModules.default
          inputs.impermanence.nixosModules.impermanence
          inputs.stylix.nixosModules.stylix
        ];
      };
      neri = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/neri/configuration.nix
          inputs.home-manager.nixosModules.default
          inputs.impermanence.nixosModules.impermanence
          inputs.stylix.nixosModules.stylix
        ];
      };
    };
  };
}
