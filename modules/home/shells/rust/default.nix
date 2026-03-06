{ config, lib, ... }: {
  options.myModules.shells.rust.enable = lib.mkEnableOption "Enable Rust dev shell";

  config = lib.mkIf config.myModules.shells.rust.enable {
    home.persistence."/persist".directories = [
      ".cargo"
      ".rustup"
    ];
  };
}
