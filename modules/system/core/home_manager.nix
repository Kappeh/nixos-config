{ config, inputs, lib, ... }: {
  options.myModules.core.home_manager.enable = lib.mkEnableOption "Enable Home Manager";

  config = lib.mkIf config.myModules.core.home_manager.enable {
    home-manager = {
      extraSpecialArgs = { inherit inputs; };
      useGlobalPkgs = true;
      useUserPackages = true;
    };
  };
}
