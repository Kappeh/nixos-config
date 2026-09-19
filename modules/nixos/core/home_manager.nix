{ inputs, ... }: {
  config = {
    home-manager = {
      extraSpecialArgs = { inherit inputs; };
      useGlobalPkgs = true;
      useUserPackages = true;
      sharedModules = [ inputs.nixcord.homeModules.nixcord ];
    };
  };
}

